package vote

class Tag {
    String name
    Date dateCreated
    Date lastUpdated
    static belongsTo = [Site,Topic]
    static hasMany = [sites:Site,topics:Topic]

    static constraints = {
        name(unique: true,nullable: false,blank: false)
    }
}
