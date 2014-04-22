import vote.User
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

    def init = { servletContext ->
        def user = new User(username: "root@gmail.com", passwordHash: new Sha512Hash("232101").toHex(),firstname: "putin",lastname: "john")
        user.addToPermissions("/")
        user.save()
    }
    def destroy = {
    }
}
