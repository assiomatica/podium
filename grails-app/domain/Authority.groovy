



/**
 * Authority domain class.
 */
class Authority {

    static hasMany = [people: Socio]

    /** description */
    String description
    /** ROLE String */
    String authority

    static constraints = {
        authority(blank: false, unique: true)
        description()
    }
        
    String toString() {
        return "${description}"
    }
}
