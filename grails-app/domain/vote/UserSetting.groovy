package vote

class UserSetting {
    String name
    String value
    User user
    Date dateCreated
    Date lastUpdated
    static belongsTo = [User]
    static constraints = {
    }
}
