package vote

class Site {
    String name
    boolean isPublic
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [User]
    static hasMany = [tags : Tag,users: User,trans: SiteTrans,topics:Topic]
    static constraints = {
        name(blank: false)
        description(blank: false)
    }

}
