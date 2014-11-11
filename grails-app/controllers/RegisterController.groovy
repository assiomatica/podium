import org.springframework.security.providers.UsernamePasswordAuthenticationToken as AuthToken
import org.springframework.security.context.SecurityContextHolder as SCH

/**
 * Registration controller.
 */
class RegisterController {

    def authenticateService
    def daoAuthenticationProvider
    // def emailerService

    static Map allowedMethods = [save: 'POST', update: 'POST']

    /**
     * User Registration Top page.
     */
    def index = {

        // skip if already logged in
        if (authenticateService.isLoggedIn()) {
            // redirect action: show
            redirect uri: '/'
            return
        }

        if (session.id) {
            def person = new Socio()
            person.properties = params
            return [person: person]
        }

        redirect uri: '/'
    }

    /**
     * User Information page for current user.
     */
    def show = {

        // get user id from session's domain class.
        def user = authenticateService.userDomain()
        if (user) {
            render view: 'show', model: [person: Socio.get(user.id)]
        }
        else {
            redirect action: index
        }
    }

    /**
     * Edit page for current user.
     */
    def edit = {

        def person
        def user = authenticateService.userDomain()
        if (user) {
            person = Socio.get(user.id)
        }

        if (!person) {
            flash.message = "[Illegal Access] User not found with id ${params.id}"
            redirect action: index
            return
        }

        [person: person]
    }

    /**
     * update action for current user's edit page
     */
    def update = {

        def person
        def user = authenticateService.userDomain()
        if (user) {
            person = Socio.get(user.id)
        }
        else {
            redirect action: index
            return
        }

        if (!person) {
            flash.message = "[Illegal Access] User not found with id ${params.id}"
            redirect action: index, id: params.id
            return
        }

        // if user want to change password. leave passwd field blank, passwd will not change.
        if (params.passwd && params.passwd.length() > 0
            && params.repasswd && params.repasswd.length() > 0) {
            if (params.passwd == params.repasswd) {
                person.passwd = authenticateService.encodePassword(params.passwd)
            }
            else {
                person.passwd = ''
                flash.message = 'The passwords you entered do not match.'
                render view: 'edit', model: [person: person]
                return
            }
        }

        person.userRealName = params.userRealName
        person.email = params.email
        if (params.emailShow) {
            person.emailShow = true
        }
        else {
            person.emailShow = false
        }

        if (person.save()) {
            println "salvato"
            redirect action: show, id: person.id
        }
        else {
            render view: 'edit', model: [person: person]
        }
    }



    /**
     * Person save action.
     */
    def save = {

        // skip if already logged in
        if (authenticateService.isLoggedIn()) {
            println "loggedin already"
            redirect uri: "/"
            return
        }

        def person = new Socio()
        person.properties = params
        
        person.cap = ''
        person.citta = ''
        person.civico = 0
        person.codiceFiscale = ''
        person.cognome = ''
        person.dataDiNascita = new Date()
        person.fisso = ''
        person.indirizzo = ''
        person.mobile = ''
        person.nome = ''
        person.provincia = ''

        def config = authenticateService.securityConfig
        def defaultRole = config.security.defaultRole

        def role = Authority.findByAuthority(defaultRole)
        if (!role) {
            person.passwd = ''
            flash.message = 'Default Authority not found.'
             println flash.message
           redirect uri: '/extras/registrazione' , model: [person: person]
            // render view: 'index', model: [person: person]
            return
        }

        if (params.captcha.toUpperCase() != session.captcha) {
            person.passwd = ''
            flash.message = 'Access code did not match.'
            println flash.message
             redirect uri: '/extras/registrazione', model: [person: person]
            // render view: 'index', model: [person: person]
            return
        }

        if (params.passwd != params.repasswd) {
            person.passwd = ''
            flash.message = 'The passwords you entered do not match.'
            println flash.message
            redirect uri: '/extras/registrazione', model: [person: person]
            // render view: 'index', model: [person: person]
            return
        }

        def pass = authenticateService.encodePassword(params.passwd)
        person.passwd = pass
        person.enabled = true
        person.completo = false
        if (person.save()) {
            println "salvato"
            role.addToPeople(person)
            if (config.security.useMail) {
                println "sendmail"
                String emailContent = 
"""
Caro  ${person.username} , grazie per esserTi registrato su

http://www.scambiacose.it

Di seguito le credenziali di accesso , stampane una copia e conservala in un luogo sicuro.

 -------------------------------------
 Nome utente: ${person.username}
 Password: ${params.passwd}

 Email: ${person.email}
 
Per completare la registrazione clicca sull'indirizzo: 

http://www.scambiacose.it/extras/riscontro?userid=${person.username}&code=${pass}

Ti verra' chiesto di inserire i tuoi dati anagrafici prima di poter utilizzare il servizio.

Arrivederci

Il Team di Scambiacose

 
"""
                sendMail {     
                  to person.email   
                  from 'register@scambiacose.it'
                  subject "Scambiacose.it - Conferma registrazione"   
                  body emailContent
                }
            }

            if( !person.save(flush:true) ) {
                person.errors.each {
                    println it
                }
            }
                       
            // def auth = new AuthToken(person.username, params.passwd)
            // def authtoken = daoAuthenticationProvider.authenticate(auth)
            // SCH.context.authentication = authtoken
            // render view: 'conferma', model: [person: person]
            redirect uri: '/extras/conferma'
        }
        else {
             flash.message = 'Errore.'
           person.passwd = ''
            person.errors.each {
                println it
                flash.message += it
            }
            render view: 'index'
        }
    }
        
    def conferma = {}
}
