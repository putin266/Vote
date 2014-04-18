import edu.tongji.ethan.User
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

    def init = { servletContext ->
        def user = new User(username: "putin", passwordHash: new Sha512Hash("232101").toHex())
        user.addToPermissions("*:*")
        user.save()
    }
    def destroy = {
    }
}
