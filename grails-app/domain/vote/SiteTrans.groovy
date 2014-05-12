package vote

class SiteTrans {
    String type
    String status
    User targetUser
    Site site
    Date dateCreated
    Date lastUpdated
    static belongsTo = [Site]
    static constraints = {
        type(inList: ["AddNewUser"],blank: false)
        status(inList: ["Closed","Open"],blank: false)
    }
}
