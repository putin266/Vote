package edu.tongji.ethan

class User {
    String username
    String passwordHash
    String firstname
    String lastname

    static hasMany = [ roles: Role, permissions: String ]

    static constraints = {
        username(nullable: false, blank: false, unique: true, email: true)
        passwordHash(nullable: false,blank: false)
        firstname(nullable: false,blank: false)
        lastname(nullable: false,blank: false)
    }
}
