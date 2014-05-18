package vote

class Site {
    String name
    boolean isPublic
    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [User]
    static hasMany = [tags : Tag,users: User, transes: SiteTrans,topics:Topic,admins:User,settings:SiteSetting]
    static constraints = {
        name(blank: false)
        description(blank: false)
        settings(nullable: true)
    }

}
