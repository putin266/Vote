package vote

class IndexController {

    def index() {

        def user = User.findById(session.user.id as Long)
        if (!user) {
            redirect(controller: 'auth', action: 'login')
            return
        }
        def topiclist = user.ftopics.toList()

        topiclist.sort{it.lastUpdated}
        topiclist = topiclist.reverse()
        [topiclist: topiclist,user:user]
    }

}
