class Socio {
    String nome
    String cognome
    String email
    Date dataDiNascita
    String indirizzo
    Integer civico
    String cap
    String citta
    String provincia
    String mobile
    String fisso
    String codiceFiscale
    Date dataRegistrazione = new Date()
    Date dataUltimoAccesso
    // i seguenti per authentication logins
    
    	static transients = ['pass']
	static belongsTo = Authority

	/** Username */
	String username
	String passwd
	boolean enabled
	boolean completo


    static hasMany = [oggetti: Oggetto,documenti: Documento,authorities: Authority]

    static constraints = {
        
        username(blank: false, unique: true)
	passwd(blank: false)
       
        nome(minSize:2, blank:true)
        cognome(maxSize:25)
        //if not declared widget, the default component is a ComboBox
        indirizzo(blank:true)
        civico(widget:"textinput",blank:true)
        cap(blank:true)
        citta(blank:true)
        provincia(maxSize:2, blank:true)
        dataDiNascita(blank:true)
        fisso(widget:"textinput")
        mobile(widget:"textinput")
	email(email:true, nullable: true, blank: true)
        codiceFiscale(codiceFiscale:true, blank: true)
        dataRegistrazione(nullable: true, blank: true)
        dataUltimoAccesso(nullable: true, blank: true)
        enabled()
        completo()
    }

    String toString() {
        return "${nome} ${cognome}"
    }

}
