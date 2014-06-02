package vote

class User {
    String username
    String passwordHash
    String firstname
    String lastname
    String status
    Date dateCreated
    Date lastUpdated
    static hasMany = [roles: Role, permissions: String, sites: Site, siteTranses: SiteTrans, contents: Content, votes: Vote, comments: Comment, topics: Topic, sentMsgs: Message, inboxMsgs: Message,settings:UserSetting]
    static mappedBy = [sites: "users",sentMsgs: "fromUser",inboxMsgs: "toUser"]
    static constraints = {
        username(nullable: false, blank: false, unique: true, email: true)
        passwordHash(nullable: false, blank: false)
        firstname(nullable: false, blank: false)
        lastname(nullable: false, blank: false)
        settings(nullable: true)
        status(nullable: true)
    }
}
