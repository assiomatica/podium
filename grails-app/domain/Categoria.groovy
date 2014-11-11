class Categoria implements Comparable {
    
    String titolo
    String descrizione
    Categoria madre
    byte[] icona
    String iconaType
    
    Integer orderIndex
    SortedSet children
    SortedSet oggetti

    static belongsTo = [madre: Categoria]

    static hasMany = [children: Categoria,oggetti: Oggetto]
    static hasOne = [madre: Categoria]
    static fetchMode = [madre:"eager"]

    static constraints = {
        titolo()
        descrizione(blank:true,nullable:true)
        icona(nullable:true, maxSize: 16384 /* 16K */)
        iconaType(nullable:true)
        madre(nullable: true, lazy:true)
        orderIndex(nullable: true)
    }
    
    int compareTo(Object o) {
        if (this.is(o)) return 0
        
        // NOTE: the orderIndex == a.orderIndex returning -1 is REQUIRED with Grails 1.1.1 to workaround
        // issues where orderIndex for children is not unique - returning 0 stops a node being returned in the set!
        if (!o || (o.orderIndex == null) || (o.orderIndex == orderIndex)) return -1
        this.orderIndex <=> o.orderIndex
    }
    
    String toString() {
        return "${titolo}"
    }
}
