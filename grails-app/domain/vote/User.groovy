package vote

import com.lucastex.grails.fileuploader.UFile

class User {
    String username
    String passwordHash
    String firstname
    String lastname
    String nickname
    String status
    String description
    String sdescription
    UFile avatar
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
        avatar(nullable: true)
        nickname(nullable: true)
        description(nullable: true)
        sdescription(nullable: true)
    }

    def boolean equals(obj) {
        if (!(obj instanceof User)) {
            return false
        }
        User user = (User) obj
        return this.id == user.id
    }
}
