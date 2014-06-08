package vote

class Vote {
    String type
    Date dateCreated
    Date lastUpdated
    User user
    static belongsTo = [User]
    static constraints = {
        type(inList: ["upvote","downvote","novote"])
    }

    def boolean equals(obj) {
        if (!(obj instanceof Vote)) {
            return false
        }
        Vote vote = (Vote) obj
        return this.id == vote.id
    }
}
