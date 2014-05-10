package vote

class Vote {
    String type
    Date creatTime
    User user
    Content content
    static belongsTo = [User,Content]
    static constraints = {
        type(inList: ["upvote","downvote"])
    }
}
