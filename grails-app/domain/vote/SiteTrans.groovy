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
        type(inList: ["ChangeRules","AddNewUser","changeSetting","createSetting","DeleteUser","DeleteTopic","DeleteContent"],blank: false)
        status(inList: ["Closed","Open"],blank: false)
        detail(nullable: true)
        postscript(nullable: true)
        targetId(nullable: true)
    }

    static mapping = {
        detail type: 'text'
    }

    def boolean equals(obj) {
        if (!(obj instanceof SiteTrans)) {
            return false
        }
        SiteTrans st = (SiteTrans) obj
        return this.id == st.id
    }
}
