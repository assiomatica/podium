class CategoriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [categoriaInstanceList: Categoria.list(params), categoriaInstanceTotal: Categoria.count()]
    }

    def listTree = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def criteria = Categoria.createCriteria()
        def query = {
            and {
                isNull('madre')
            }
        }
        def results = criteria.list(query,max:params.max,offset:params.offset,sort:'descrizione')
        println results
        [categoriaInstanceList: results, categoriaInstanceTotal: Categoria.count()]
    }

    def create = {
        def categoriaInstance = new Categoria()
        categoriaInstance.properties = params
        return [categoriaInstance: categoriaInstance]
    }

    def save = {
        def categoriaInstance = new Categoria(params)
        if (categoriaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
            redirect(action: "show", id: categoriaInstance.id)
        }
        else {
            render(view: "create", model: [categoriaInstance: categoriaInstance])
        }
    }

    def show = {
        def categoriaInstance = Categoria.get(params.id)
        if (!categoriaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
        else {
            [categoriaInstance: categoriaInstance]
        }
    }

    def edit = {
        def categoriaInstance = Categoria.get(params.id)
        if (!categoriaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [categoriaInstance: categoriaInstance]
        }
    }

    def update = {
        def categoriaInstance = Categoria.get(params.id)
        if (categoriaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (categoriaInstance.version > version) {
                    
                    categoriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'categoria.label', default: 'Categoria')] as Object[], "Another user has updated this Categoria while you were editing")
                    render(view: "edit", model: [categoriaInstance: categoriaInstance])
                    return
                }
            }
            categoriaInstance.properties = params
            if (!categoriaInstance.hasErrors() && categoriaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'categoria.label', default: 'Categoria'), categoriaInstance.id])}"
                redirect(action: "show", id: categoriaInstance.id)
            }
            else {
                render(view: "edit", model: [categoriaInstance: categoriaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def categoriaInstance = Categoria.get(params.id)
        if (categoriaInstance) {
            try {
                categoriaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'categoria.label', default: 'Categoria'), params.id])}"
            redirect(action: "list")
        }
    }
    def select_icona = {}
    
    def upload_icona = {
        def categoria = Categoria.get(params["categoria"])
        // Get the avatar file from the multi-part request 
        
        def f = request.getFile('avatar')

        // List of OK mime-types 
        def okcontents = ['image/png', 'image/gif'] 
        if (! okcontents.contains(f.getContentType())) { 
            flash.message = "Avatar must be one of: ${okcontents}" 
            render(view:'select_icona', model:[categoria:categoria]) 
            return; 
        }

        // Save the image and mime type 
        categoria.icona = f.getBytes() 
        categoria.iconaType = f.getContentType() 
        log.info("File uploaded: " + categoria.iconaType)

        // Validation works, will check if the image is too big 
        if (!categoria.save()) { 
            render(view:'select_icona', model:[categoria:categoria]) 
            return; 
        } 
        flash.message = "Icona (${categoria.iconaType}, ${categoria.icona.size()} bytes) caricata." 
        redirect(action:'edit', id:categoria.id ) 
        }
    
    def icona_image = {
      def avatarUser = Categoria.get(params.id)
      if (!avatarUser || !avatarUser.icona || !avatarUser.iconaType) {
        response.sendError(404)
        return;
      }
      response.setContentType(avatarUser.iconaType)
      response.setContentLength(avatarUser.icona.size())
      OutputStream out = response.getOutputStream();
      out.write(avatarUser.icona);
      out.close();
    }    
    
    }
