package vote

class Content {
    String content
    Boolean candidate
    Date dateCreated
    Date lastUpdated
    User user
    Topic topic
    static belongsTo = [User,Topic]
    static hasMany = [comments: Comment,votes:Vote]
    static constraints = {
    }
    static mapping = {
        content type: 'text'
    }
}
