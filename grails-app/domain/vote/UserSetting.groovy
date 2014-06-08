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

    def boolean equals(obj) {
        if (!(obj instanceof UserSetting)) {
            return false
        }
        UserSetting setting = (UserSetting) obj
        return this.id == setting.id
    }
}
