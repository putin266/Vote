package vote

class Topic {
    String title
    String type
    String detail
    Boolean candidate
    Date createTime
    Date lastUpdateTime
    Site site
    User user
    static belongsTo = [Site,User]
    static hasMany = [tags: Tag,contents: Content,comments: Comment,votes:Vote]
    static constraints = {
    }
}
