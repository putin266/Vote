package vote


class Comment {
    String comment
    Date createTime
    User user
    static belongsTo = [User]
    static constraints = {
    }
}
