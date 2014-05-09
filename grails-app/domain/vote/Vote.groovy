package vote

class Vote {
    String type
    Date creatTime
    static belongsTo = [User,Content]
    static hasOne = [user:User,content:Content]
    static constraints = {
        type(inList: ["upvote","downvote"])
    }
}
