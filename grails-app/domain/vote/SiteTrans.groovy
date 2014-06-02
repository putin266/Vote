package vote

class SiteTrans {
    String type
    String status
    String targetDomain
    String targetId
    String detail
    String postscript
    Site site
    Date dateCreated
    Date lastUpdated
    User user
    static belongsTo = [Site,User]
    static hasMany = [votes:Vote,comments:Comment]
    static constraints = {
        type(inList: ["AddNewUser","changeSetting","createSetting"],blank: false)
        status(inList: ["Closed","Open"],blank: false)
        detail(nullable: true)
        postscript(nullable: true)
        targetId(nullable: true)
    }
}
