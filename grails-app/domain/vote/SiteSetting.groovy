package vote

class SiteSetting {
    String name
    String value
    Site site
    Date dateCreated
    Date lastUpdated
    static belongsTo = [Site]
    static constraints = {
    }
}
