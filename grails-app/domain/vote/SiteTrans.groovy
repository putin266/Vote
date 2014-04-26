package vote

class SiteTrans {
    String type
    String status
    static belongsTo = [Site]
    static hasOne = [targetUser: User,site:Site]
    static constraints = {
        type(inList: ["AddNewUser"],blank: false)
        status(inList: ["Closed","Open"],blank: false)
    }
}
