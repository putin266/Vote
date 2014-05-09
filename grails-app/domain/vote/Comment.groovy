package vote


class Comment {
    String content
    Date createTime
    static belongsTo = [Content,User]
    static hasOne = [content:Content,user:User]
    static constraints = {
    }
}
