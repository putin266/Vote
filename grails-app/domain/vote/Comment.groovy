package vote


class Comment {
    String comment
    Date createTime
    Content content
    User user
    static belongsTo = [Content,User]
    static constraints = {
    }
}
