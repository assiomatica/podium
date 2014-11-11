class SocioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    
    static navigation = [group: 'weceem.app.admin', action: 'list', title: 'soci']
    
    def authenticateService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [socioInstanceList: Socio.list(params), socioInstanceTotal: Socio.count()]
    }

    def create = {
        [socio: new Socio(params), authorityList: Authority.list()]
    }

    def save = {
        def socioInstance = new Socio(params)
	socioInstance.passwd = authenticateService.encodePassword(params.passwd)
        if (socioInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'socio.label', default: 'Socio'), socioInstance.id])}"
            redirect(action: "show", id: socioInstance.id)
        }
        else {
            render(view: "create", model: [socioInstance: socioInstance])
        }
    }

    def show = {
        def socioInstance = Socio.get(params.id)
        if (!socioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
            redirect(action: "list")
        }
        else {
            List roleNames = []
            for (role in socioInstance.authorities) {
                roleNames << role.authority
            }
            roleNames.sort { n1, n2 ->
                n1 <=> n2
            }
            [socioInstance: socioInstance, roleNames: roleNames]
        }
    }

    def edit = {
        def socioInstance = Socio.get(params.id)
        if (!socioInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
            redirect(action: "list")
        }
        else {
            return buildPersonModel(socioInstance)
        }
    }

    def update = {
        def socioInstance = Socio.get(params.id)
        if (socioInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (socioInstance.version > version) {
                    
                    socioInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'socio.label', default: 'Socio')] as Object[], "Another user has updated this Socio while you were editing")
                    render(view: "edit", model: buildPersonModel(socioInstance))
                    return
                }
            }
            def oldPassword = socioInstance.passwd
            socioInstance.properties = params
            if (!params.passwd.equals(oldPassword)) {
                socioInstance.passwd = authenticateService.encodePassword(params.passwd)
            }

            if (!socioInstance.hasErrors() && socioInstance.save(flush: true)) {
                Authority.findAll().each { it.removeFromPeople(socioInstance) }
                addRoles(socioInstance)

                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'socio.label', default: 'Socio'), socioInstance.id])}"
                redirect(action: "show", id: socioInstance.id)
            }
            else {
                render(view: "edit", model: [socioInstance: socioInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
            redirect(action: "list")
        }
    }

       def update1 = {
        def socioInstance = Socio.get(params.id)
        if (socioInstance) {
            socioInstance.properties = params
            socioInstance.completo = true
            if (!socioInstance.hasErrors() && socioInstance.save(flush: true)) {

                // flash.message = "${socioInstance.nome}"
                redirect uri:'/extras/messaggio?msg='+'Dati salvati con successo!'
            }
            else {
                flash.message = 'Errore nel salvataggio dei dati: SocioController/update! - '
                socioInstance.errors.each {
                    println it
                    flash.message += it
                }
                redirect uri:'/extras/messaggio?msg='+flash.message
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
            redirect uri:'/extras/messaggio?msg='+flash.message
        }
    }

    def delete = {
        def socioInstance = Socio.get(params.id)
        if (socioInstance) {
            try {
                Authority.findAll().each { it.removeFromPeople(socioInstance) }

                socioInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'socio.label', default: 'Socio'), params.id])}"
            redirect(action: "list")
        }
    }
    
    private Map buildPersonModel(socio) {

        List roles = Authority.list()
        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        Set userRoleNames = []
        for (role in socio.authorities) {
            userRoleNames << role.authority
        }
        LinkedHashMap<Authority, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)] = userRoleNames.contains(role.authority)
        }
        println socio
        println roleMap

        return [socioInstance: socio, roleMap: roleMap]
    }
        
    private void addRoles(person) {
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                Authority.findByAuthority(key).addToPeople(person)
            }
        }
    }
}
