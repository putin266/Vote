package vote

class Tag {
    String name

    static belongsTo = [Site]
    static hasMany = [sites:Site]

    static constraints = {
        name(unique: true,nullable: false,blank: false)
    }
}
