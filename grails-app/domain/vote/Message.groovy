package vote

class Message {
    User toUser
    User fromUser
    Site fromSite
    String content
    String type
    Topic topic
    Date dateCreated
    static belongsTo = [User]
    static constraints = {
        fromUser(nullable: true)
        fromSite(nullable: true)
    }

    def boolean equals(obj) {
        if (!(obj instanceof Message)) {
            return false
        }
        Message msg = (Message) obj
        return this.id == msg.id
    }
}
