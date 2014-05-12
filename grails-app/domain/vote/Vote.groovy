package vote

class Vote {
    String type
    Date dateCreated
    Date lastUpdated
    User user
    static belongsTo = [User]
    static constraints = {
        type(inList: ["upvote","downvote","novote"])
    }
}
