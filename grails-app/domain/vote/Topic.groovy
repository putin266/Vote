package vote

class Topic {
    String title
    String type
    String detail
    Boolean candidate
    Date dateCreated
    Date lastUpdated
    Site site
    User user
    static belongsTo = [Site,User]
    static hasMany = [tags: Tag,contents: Content,comments: Comment,votes:Vote]
    static constraints = {
    }

    static mapping = {
        detail type: 'text'
    }

    def boolean equals(obj) {
        if (!(obj instanceof Topic)) {
            return false
        }
        Topic topic = (Topic) obj
        return this.id == topic.id
    }
}
