class OggettoController {


    def scaffold = Oggetto

    def save = {
        def oggetto = new Oggetto(params)
        if(!oggetto.hasErrors() && oggetto.save()) {
            flash.message = "oggetto ${oggetto.id} creato"
            creaPunteggio(oggetto.socio,oggetto)
            redirect(action:show,id:oggetto.id)
        }
        else {
            render(view:'create',model:[oggetto:oggetto])
        }
    }


    def deleteImmagine = {
        def immagine = Immagine.get( params.id )
        def filename = immagine.imageURL
        def immobileId = immagine.oggetto.id
        if(immagine) {
            immagine.delete()
            flash.message = "Immagine ${params.id} deleted"
            deleteFile(filename) // cancella fisicamente il file
        }
        else {
            flash.message = "Immagine not found with id ${params.id}"
        }
        redirect(controller : 'oggetto',action:edit,id:immagine.oggetto.id)
    }

    def deleteFile(String filename) {
        // images.location = "web-app/images/" in Config.groovy
        def file = new File( grailsApplication.config.images.location.toString() + File.separatorChar +   filename )
        file.delete()
        file = new File( grailsApplication.config.images.location.toString() + File.separatorChar +"thumbnails/"+   filename )
        file.delete()
        file = new File( grailsApplication.config.images.location.toString() + File.separatorChar +"thumbnails/big_"+   filename )
        file.delete()
        flash.message = "file ${filename} removed"
    }

    def editImmagine = {
        redirect(controller : 'immagine',action:edit,id:params.id)
    }

    def creaPunteggio(Socio socio,Oggetto oggetto) {
        def punteggio = new Punteggio()
        punteggio.socio = socio
        punteggio.oggetto = oggetto
        punteggio.data = new Date()
        punteggio.punti = oggetto.prezzo
        if(!punteggio.hasErrors() && punteggio.save()) {
            flash.message += "\npunteggio creato."
        }
        else {
            flash.message = "Errore creando il punteggio."
        }
    }
}
