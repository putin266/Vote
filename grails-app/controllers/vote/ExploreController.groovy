package vote

class ExploreController {

    def index() {
        redirect(action: "othersites")
    }
    def othersites() {
        def siteslist = Site.list().sort {
            -it.users.size()
        }
        def user = User.findById(session.user.id as Long)
        siteslist.removeAll(user?.sites)
        user?.siteTranses?.each {
                if(it.type == "AddNewUser" && it.status == "Open"){
                    siteslist.remove(it.site)
            }
        }
        siteslist.each {it.getUsers()}
        [siteslist:siteslist]
    }
}
