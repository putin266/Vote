package vote

class Content {
    String content
    String type
    Boolean candidate
    Date createTime
    static belongsTo = [User,Topic]
    static hasOne = [user:User,topic: Topic]
    static hasMany = [comments: Comment,votes:Vote]
    static constraints = {
        type(inList: ["detail","content"])
    }
}
