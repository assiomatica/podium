import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
class FileResourceController {
    
    def index = { redirect(action:list,params:params) }
    static transactional = true
    
    static def allowedMethods = []

    def listFiles = {
        def fileResourceInstanceList = []
        def f = new File( grailsApplication.config.images.location.toString() )
        if( f.exists() ){
            f.eachFile(){ file->
                if( !file.isDirectory() )
                fileResourceInstanceList.add( file.name )
            }
        }
        [ fileResourceInstanceList: fileResourceInstanceList ]
    }
    
    def list = {
        def oggetto = Oggetto.get(params.oggettoId)
        
        Immagine.findAllByOggetto(oggetto, params)
    }


    def delete = {
        def filename = params.id.replace('%23%23%23', '.')
        println(filename)
        // images.location = "web-app/images/" in Config.groovy
        def file = new File( grailsApplication.config.images.location.toString() + File.separatorChar +   filename )
        file.delete()
        flash.message = "file ${filename} removed"
        redirect( action:list )
    }
    
    def upload = {
        DefaultMultipartHttpServletRequest mpr = (DefaultMultipartHttpServletRequest)request;
        Iterator itr = mpr.getFileNames();

        while(itr.hasNext()) {
            CommonsMultipartFile file = mpr.getFile(itr.next());
        if (!file.isEmpty()) {
            new File( grailsApplication.config.images.location.toString() ).mkdirs()
            new File( grailsApplication.config.images.location.toString() +"/thumbnails/" ).mkdirs()
            File saveLocation = new File(grailsApplication.config.images.location.toString());

            File tempfile = File.createTempFile("photo", ".jpg", saveLocation  ) 
            file.transferTo(tempfile);
            def t = new Thumbnails() 
            t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/" + tempfile.name, 200,200)
            t.scala(saveLocation.toString() +"/"+ tempfile.name, saveLocation.toString() +"/thumbnails/big_" + tempfile.name, 500,500)
        }
        else
        {
            flash.message = "Caricamento immagine fallito."
        }
        }
        // Trigger an Event.COMPLETE event, notifying the Flex client
        // response.sendError(200,'Done');
       response.sendError(200,'Done');
       def oggetto = Oggetto.get(params.oggettoId)
       // creanuova e appendila all'oggetto
       
       
       redirect( action:list)
    }
}
