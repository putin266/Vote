import vote.Site
import vote.User
import org.apache.shiro.crypto.hash.Sha512Hash

class BootStrap {

    def init = { servletContext ->
        if(!User.findByUsername("root@gmail.com")){
            def user = new User(username: "root@gmail.com", passwordHash: new Sha512Hash("232101").toHex(),firstname: "root",lastname: "root")
            user.addToPermissions("/")
            user.save()
        }
        if(!User.findByUsername("putin@gmail.com")){
            def user = new User(username: "putin@gmail.com", passwordHash: new Sha512Hash("232101").toHex(),firstname: "putin",lastname: "john")
            user.addToPermissions("/")
            user.save()
        }
        def user = User.findByUsername("putin@gmail.com")
        def site = Site.findById(1)
        if(user){
            if(site && !user.sites?.contains(site)){
                user.addToSites(site)
                user.save()
            }
        }

    }
    def destroy = {
    }
}
