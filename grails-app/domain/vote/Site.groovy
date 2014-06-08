package vote

import com.lucastex.grails.fileuploader.UFile

class Site {
    String name
    boolean isPublic
    String description
    String rules
    Date dateCreated
    Date lastUpdated
    UFile logo
    static belongsTo = [User]
    static hasMany = [tags : Tag,users: User, transes: SiteTrans,topics:Topic,admins:User,settings:SiteSetting]
    static constraints = {
        name(blank: false)
        description(blank: false)
        settings(nullable: true)
        logo(nullable: true)
        rules(nullable: true)
    }

    static mapping = {
        rules type: 'text'
    }


    def boolean equals(obj) {
        if (!(obj instanceof Site)) {
            return false
        }
        Site site = (Site) obj
        return this.id == site.id
    }
}
