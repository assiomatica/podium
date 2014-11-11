import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
class DocumentoController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ documentoList: Documento.list( params ) ]
    }

    def show = {
        def documento = Documento.get( params.id )

        if(!documento) {
            flash.message = "Documento not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ documento : documento ] }
    }

    def delete = {
        def documento = Documento.get( params.id )
        def filename = documento.imageURL
        if(documento) {
            documento.delete()
            flash.message = "Documento ${params.id} deleted"
            deleteFile(filename) // cancella fisicamente il file
            redirect(action:list)
        }
        else {
            flash.message = "Documento not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def documento = Documento.get( params.id )

        if(!documento) {
            flash.message = "Documento not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ documento : documento ]
        }
    }

    def update = {
        def documento = Documento.get( params.id )
        if(documento) {
            documento.properties = params
            if(!documento.hasErrors() && documento.save()) {
                flash.message = "Documento ${params.id} updated"
                // redirect(action:show,id:documento.id)
                redirect(controller : 'socio',action:edit,id:documento.socio.id)
            }
            else {
                render(view:'edit',model:[documento:documento])
            }
        }
        else {
            flash.message = "Documento not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def documento = new Documento()
        documento.properties = params
        return ['documento':documento]
    }

    def save = {
        def documento = new Documento(params)
        if(!documento.hasErrors() && documento.save()) {
            flash.message = "Documento ${documento.id} created"
            redirect(action:show,id:documento.id)
        }
        else {
            render(view:'create',model:[documento:documento])
        }
    }


    def upload = {
        def tempfile
        DefaultMultipartHttpServletRequest mpr = (DefaultMultipartHttpServletRequest)request;
        Iterator itr = mpr.getFileNames();

        while(itr.hasNext()) {
            CommonsMultipartFile file = mpr.getFile(itr.next());
            if (!file.isEmpty()) {
                new File( grailsApplication.config.images.location.toString() ).mkdirs()
                new File( grailsApplication.config.images.location.toString() +"/thumbnails/" ).mkdirs()
                File saveLocation = new File(grailsApplication.config.images.location.toString());
                tempfile = File.createTempFile("photo", ".jpg", saveLocation  )
                file.transferTo(tempfile);
                def t = new Thumbnails()
                t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/" + tempfile.name, 200,200)
                t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/big_" + tempfile.name, 500,500)
println(tempfile)
            }
            else
            {
                flash.message = "Caricamento documento fallito."
                redirect(controller : 'socio',action:edit,id:params.socio.id)
            }
        }
        // response.sendError(200,'Done');

        def documento = new Documento(params)
        documento.imageURL = tempfile.name;

        if(!documento.hasErrors() && documento.save()) {
            flash.message = "Documento ${documento.id} created"
            redirect(controller : 'socio',action:edit,id:documento.socio.id)

        }
        else {
            render(view:'create',model:[documento:documento])
            // redirect(controller : 'socio',action:edit,id:params.socio.id)
        }
        // redirect( action:list)
    }
}
