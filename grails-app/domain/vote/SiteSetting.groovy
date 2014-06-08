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

    def boolean equals(obj) {
        if (!(obj instanceof SiteSetting)) {
            return false
        }
        SiteSetting ss = (SiteSetting) obj
        return this.id == ss.id
    }
}
