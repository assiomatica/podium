import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.codehaus.groovy.grails.commons.ConfigurationHolder
import org.codehaus.groovy.grails.web.context.ServletContextHolder


class ImmagineController {

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static def allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        if(!params.max) params.max = 10
        [ immagineList: Immagine.list( params ) ]
    }

    def show = {
        def immagine = Immagine.get( params.id )

        if(!immagine) {
            flash.message = "Immagine not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ immagine : immagine ] }
    }

    def delete = {
        def immagine = Immagine.get( params.id )
        def filename = immagine.imageURL
        if(immagine) {
            immagine.delete()
            flash.message = "Immagine ${params.id} deleted"
            deleteFile(filename) // cancella fisicamente il file
            redirect(action:list)
        }
        else {
            flash.message = "Immagine not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def immagine = Immagine.get( params.id )

        if(!immagine) {
            flash.message = "Immagine not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ immagine : immagine ]
        }
    }

    def update = {
        def immagine = Immagine.get( params.id )
        if(immagine) {
            immagine.properties = params
            if(!immagine.hasErrors() && immagine.save()) {
                flash.message = "Immagine ${params.id} updated"
                // redirect(action:show,id:immagine.id)
                redirect(controller : 'oggetto',action:edit,id:immagine.oggetto.id)
            }
            else {
                render(view:'edit',model:[immagine:immagine])
            }
        }
        else {
            flash.message = "Immagine not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def immagine = new Immagine()
        immagine.properties = params
        return ['immagine':immagine]
    }

    def save = {
        def immagine = new Immagine(params)
        if(!immagine.hasErrors() && immagine.save()) {
            flash.message = "Immagine ${immagine.id} created"
            redirect(action:show,id:immagine.id)
        }
        else {
            render(view:'create',model:[immagine:immagine])
        }
    }


    def upload = {
        
        // def tSizeSmall = Integer.parseInt(ConfigurationHolder.config.images.thumbnail.small.size)
        def tSizeSmall = ConfigurationHolder.config.images.thumbnail.small.size
        if (tSizeSmall == null)  tSizeSmall = 75
        // def tSizeBig = Integer.parseInt(ConfigurationHolder.config.images.thumbnail.big.size)
        def tSizeBig = ConfigurationHolder.config.images.thumbnail.big.size
        if (tSizeBig == null)  tSizeBig = 400

        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(ConfigurationHolder.config.images.location.toString())

        // Create storage path directory if it does not exist
        def saveLocation = new File(storagePath)
        if (!saveLocation.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (saveLocation.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }
        new File( storagePath +"/thumbnails/" ).mkdirs()
        def tempfile
        DefaultMultipartHttpServletRequest mpr = (DefaultMultipartHttpServletRequest)request;
        Iterator itr = mpr.getFileNames();

        while(itr.hasNext()) {
            CommonsMultipartFile file = mpr.getFile(itr.next());
            if (!file.isEmpty()) {

                tempfile = File.createTempFile("photo", ".jpg", saveLocation  )
                file.transferTo(tempfile);
                def t = new Thumbnails()
                t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/" + tempfile.name, tSizeSmall,tSizeSmall)
                t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/big_" + tempfile.name, tSizeBig,tSizeBig)
            }
            else
            {
                flash.message = "Caricamento immagine fallito."
                redirect(controller : 'oggetto',action:edit,id:params.oggetto.id)
            }
        }
        // response.sendError(200,'Done');

        def immagine = new Immagine(params)
        immagine.imageURL = tempfile.name;
// println params
        if(!immagine.hasErrors() && immagine.save()) {
            flash.message = "Immagine ${immagine.id} created"
            // redirect(controller : 'oggetto',action:edit,id:immagine.oggetto.id)
render "OK"
        }
        else {
            render(view:'create',model:[immagine:immagine])
            // redirect(controller : 'oggetto',action:edit,id:params.oggetto.id)
        }
        // redirect( action:list)
    }
}
