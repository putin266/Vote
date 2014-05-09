package vote

class User {
    String username
    String passwordHash
    String firstname
    String lastname

    static hasMany = [ roles: Role, permissions: String,sites: Site,sitetrans: SiteTrans,usertrans: UserTrans,contents:Content,votes: Vote,comments:Comment]

    static constraints = {
        username(nullable: false, blank: false, unique: true, email: true)
        passwordHash(nullable: false,blank: false)
        firstname(nullable: false,blank: false)
        lastname(nullable: false,blank: false)
    }
}
