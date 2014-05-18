package vote

class SiteTrans {
    String type
    String status
    String targetDomain
    String targetId
    String postscript
    Site site
    Date dateCreated
    Date lastUpdated
    static belongsTo = [Site]
    static constraints = {
        type(inList: ["AddNewUser"],blank: false)
        status(inList: ["Closed","Open"],blank: false)
    }
}
