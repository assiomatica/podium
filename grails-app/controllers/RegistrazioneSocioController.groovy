class RegistrazioneSocioController {

    def index = {
			redirect(action:search,params:params)
	}
    
    def search = {
			def query = params.query

			if (query) {
				log.debug("query $query")
                                def decrypted = cr.co.arquetipos.crypto.Blowfish.decrypt(query.decodeHex(), 'password')
                                String decryptedString = new String(decrypted)
                                log.debug(decryptedString)
				def socio = Socio.get(decryptedString.toLong())
                if(!socio) {
                    flash.message = "Socio not found with id ${query}"
                    redirect(action:search)
                }
                else {
                    redirect(controller : 'register',action:index, params:[socioId:socio.id])
                }
			} else {
				return [ : ]
			}
	}
}
