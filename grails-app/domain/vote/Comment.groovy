package vote


class Comment {
    String comment
    Date dateCreated
    User user
    static belongsTo = [User]
    static constraints = {
    }
}
