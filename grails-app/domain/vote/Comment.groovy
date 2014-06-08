package vote


class Comment {
    String comment
    Date dateCreated
    User user
    static belongsTo = [User]
    static constraints = {
    }

    def boolean equals(obj) {
        if (!(obj instanceof Comment)) {
            return false
        }
        Comment comment = (Comment) obj
        return this.id == comment.id
    }
}
