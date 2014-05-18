package vote

class Message {
    User toUser
    User fromUser
    Site fromSite
    String content
    String type
    Date dateCreated
    static belongsTo = [User]
    static constraints = {
        fromUser(nullable: true)
        fromSite(nullable: true)
    }
}
