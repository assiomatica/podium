class Documento {
    String descrizione
    String imageURL
    Socio socio

    static belongsTo = [ Socio ]

    String toString() {
      return "${descrizione}"
    }
    static constraints = {
         descrizione(nullable:true)
    }
  }