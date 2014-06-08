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

    def boolean equals(obj) {
        if (!(obj instanceof Tag)) {
            return false
        }
        Tag tag = (Tag) obj
        return this.id == tag.id
    }
}
