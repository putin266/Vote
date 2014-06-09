package vote

class IndexController {

    def index() {
        def user = User.findById(session.user.id as Long)
        def hasMore = false
        def page = 1
        if (!user) {
            redirect(controller: 'auth', action: 'login')
            return
        }
        def topiclist = user.ftopics.toList()

        topiclist = topiclist.sort { it.lastUpdated }
        topiclist = topiclist.reverse()
        if(topiclist.size() > 10){
            hasMore = true
            topiclist = topiclist.subList(0, 10)
        }
        [topiclist: topiclist, user: user,page: page, hasMore: hasMore]
    }

    def moreTopics() {
        def user = User.findById(session.user.id as Long)
        def hasMore = false
        def page = params.page as Integer
        page++

        def topiclist = user.ftopics.toList()

        topiclist = topiclist.sort{it.lastUpdated}
        topiclist = topiclist.reverse()

        if (topiclist.size() > (10 * page)) {
            hasMore = true
            topiclist = topiclist.subList(0, 10 * page)
        }
        render(view: '/topic/_topiclist', model: [topics: topiclist, user: user, page: page, hasMore: hasMore, domain: user])
    }

}
