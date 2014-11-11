class Immagine {
    String descrizione
    String imageURL
    Oggetto oggetto

    static belongsTo = [ Oggetto ]

    String toString() {
      return "${descrizione}"
    }
    static constraints = {
         descrizione(nullable:true)
    }
  }
