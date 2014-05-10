package vote

class Content {
    String content
    Boolean candidate
    Date createTime
    User user
    Topic topic
    static belongsTo = [User,Topic]
    static hasMany = [comments: Comment,votes:Vote]
    static constraints = {
    }
}
