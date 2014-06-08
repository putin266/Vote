package vote

class Role {
    String name
    static hasMany = [ users: User, permissions: String ]
    static belongsTo = User
    static constraints = {
        name(nullable: false, blank: false, unique: true)
    }

    def boolean equals(obj) {
        if (!(obj instanceof Role)) {
            return false
        }
        Role role = (Role) obj
        return this.id == role.id
    }
}
