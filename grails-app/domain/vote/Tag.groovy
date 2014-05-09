package vote

class Tag {
    String name

    static belongsTo = [Site,Topic]
    static hasMany = [sites:Site,topics:Topic]

    static constraints = {
        name(unique: true,nullable: false,blank: false)
    }
}
