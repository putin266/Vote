package vote

class Topic {
    String title
    String type
    Date lastUpdateTime
    static hasMany = [tags: Tag,contents: Content]
    static constraints = {
    }
}
