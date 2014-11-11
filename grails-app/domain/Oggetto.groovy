
class Oggetto extends com.metasieve.shoppingcart.Shoppable {
    
    String titolo
    String descrizione
    int prezzo
    Date dataingresso = new Date() 
    Date datauscita
    Socio socio
    Categoria categoria
    boolean inEvidenza
    boolean onLine

    static hasMany = [ foto: Immagine ]
    // static belongsTo = [ Socio ]

    static constraints = {
        titolo(blank:false)
        descrizione(widget:"textarea",blank:false)
        datauscita(nullable:true)
        inEvidenza(nullable:true)
        socio(nullable:true)
        onLine(nullable:true)
    }

    String toString() {
        return "${titolo}"
    }

}
