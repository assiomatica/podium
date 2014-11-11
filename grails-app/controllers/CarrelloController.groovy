class CarrelloController {


    def shoppingCartService

    def index = {
        redirect(action:show, params:params)
    }

    def show = { 
        render template:'shoppingCartContent'
    }
/*
    def search = {
        def id = params.id
        // controllare se oggetto presente (cioe' datauscita != null)'
        if (id) {
            if (id.substring(0,1) != 'O') {
                flash.message = "Codice errato, tessera socio?"
                redirect(controller : 'carrello',action:show, params:["socioId":params.socioId])
            }

            def oggetto = Oggetto.get(params.id.substring(1))
            if (oggetto.datauscita != null) {
                flash.message = "Errore: Oggetto gia' consegnato."
                redirect(controller : 'carrello',action:show, params:["socioId":params.socioId])
            }
            if(oggetto == null) {
                flash.message = "Codice oggetto: ${id.substring(1)} inesistente."
            } else {
                oggetto.addToShoppingCart()
            }
            redirect(controller : 'carrello',action:show, params:["socioId":params.socioId])
        } else {
            return [ : ]
        }
    }
*/
    def done = {
        render "da fare"
    }
    
        def add = {
		def product
	        product = Oggetto.get(params.id)
		if(params.version) {
            def version = params.version.toLong()
            if(product.version > version) {
				product.errors.rejectValue("version", "shoppable.optimistic.locking.failure", message(code:"Shoppable.already.updated"))
			} else {
				product.addToShoppingCart()
			}
		} else {
			product.addToShoppingCart()
		}

		redirect(action:show, params:params)
	}
    /*
    def add = {
    def product
    if (params.class == 'class+Oggetto') {
    product = Oggetto.get(params.id)
    } else {
    product = Shoppable.get(params.id)
    }
    product.addToShoppingCart()
    // redirect(action:show, params:params)

    render(template:'shoppingCartContent')
    }
     */
    def remove = {
        def product
        if (params.class == 'class+Oggetto') {
            product = Oggetto.get(params.id)
        } else {
            product = Shoppable.get(params.id)
        }
        product.removeFromShoppingCart()

        render(template:'shoppingCartContent')
    }

    def removeAll = {
        def product
            product = Oggetto.get(params.id)
        product.removeQuantityFromShoppingCart(shoppingCartService.getQuantity(product))

        render(template:'shoppingCartContent')
    }

    def checkOut = {
        def socio = Socio.get( params.socioId )
        // creare punteggio
        def checkedOutItems = shoppingCartService.checkOut()
       if (checkedOutItems.size() != 0) {
            checkedOutItems.each {
                System.out.println(it['item'].id);
                def punteggio = new Punteggio()
                def oggetto = Oggetto.get(it['item'].id)
                oggetto.datauscita = new Date() // aggiorno data uscita
                punteggio.socio = socio
                punteggio.oggetto = oggetto
                punteggio.data = new Date()
                punteggio.punti = -oggetto.prezzo
                System.out.println("socio "+socio);
                System.out.println("oggetto "+oggetto);
                System.out.println("punti "+(-oggetto.prezzo));
                if(!punteggio.hasErrors() && punteggio.save()) {
                    System.out.println("\npunteggio creato.");
                }
                else {
                    System.out.println("Errore creando il punteggio.");
                }
            }
            redirect(action:done, params:["socioId":params.socioId])
         } else {
             flash.message = "Errore: Carrello vuoto!"
             redirect(action:show, params:["socioId":params.socioId])
            // render(template:'shoppingCartContent', model:['checkedOutItems':checkedOutItems])
        }
    }

    def searchSocio = {
        def query = params.query

        if (query) {
            log.debug("query $query")
            if (query.substring(0,1) != 'S') {
                flash.message = "Codice errato, etichetta oggetto?"
                redirect(action:search)
            }

            def socio = Socio.get(query.substring(1))
            if(!socio) {
                flash.message = "Socio not found with id ${query.substring(1)}"
                redirect(action:search)
            }
            else {
                redirect(action:show, params:[socioId:socio.id])
            }
        } else {
            return [ : ]
        }
    }


}