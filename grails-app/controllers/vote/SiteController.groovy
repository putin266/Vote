package vote

class SiteController {

    def index() {
        if (!params.id) {
            redirect(action: "mysites")
        } else {
            def site = Site.findById(params.id)
            def user = User.findById(session.user.id as Long)
            def flag = site.users.contains(user)
            def topiclist = (site.topics.toList().sort {it.lastUpdated}).reverse()
            [site: site, accepted: flag, topiclist: topiclist]
        }

    }

    def mysites() {
        def user = User.findById(session.user.id as Long)
        def siteslist = user?.sites.toList()
        def trans = SiteTrans.findAll { type == "AddNewUser" && status == "Open" && targetDomain == "user" && targetId == user.id.toString() }
        def appliedsites = new ArrayList()
        trans.each { appliedsites.add(it.site) }
        siteslist = (siteslist.sort {it.lastUpdated}).reverse()
        [siteslist: siteslist, appliedsites: appliedsites]
    }


    def newsite() {
    }

    def newtopic() {
        def user = User.findById(session.user.id as Long)
        def site = Site.findById(params.siteid as Long)
        def flag = false
        if ("information".equals(params.topicType)) {
            flag = true
        }
        def topic = new Topic(title: params.title, type: params.topicType, detail: params.editorcontent, candidate: flag, user: user)
        TagService.strToTagList(params.tags as String).each { topic.addToTags(it) }
        site.addToTopics(topic)
        user.addToTopics(topic)
        if (topic?.validate() && user && site) {
            user.save()
            site.save()
            flash.message = "New Topic Created"
            redirect(action: "index", id: params.siteid)
            return
        } else {
            flash.error = "System error occurs, Please try later" + "\ntopic errors:" + topic.errors
            redirect(action: "index", id: params.siteid)
        }

    }

    def follow() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)
        if (user) {
            if (user.sites.contains(site)) {
                flash.message = "The site has been followed"
            } else {
                def sitetrans = new SiteTrans(type: "AddNewUser", status: "Open", site: site, targetDomain: "user", targetId: user.id.toString())
                if (SiteTrans.find { type == "AddNewUser" && status == "Open" && targetDomain == "user" && targetId == user.id.toString() && site == site }) {
                    flash.message = "The apply has been sent before! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                }
                if (sitetrans) {
                    site.addToTranses(sitetrans)
                    site.save()
                    flash.message = "The apply has been sent! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                } else {
                    flash.error = "Follow Failed, Please Try Again"
                    redirect(action: "mysites")
                    return
                }
            }
        } else {
            flash.error = "Not login"
            redirect(controller: "auth", action: "login")
            return
        }
    }

    def create() {
        if (!params.get("agreed").equals("on")) {
            flash.error = "Not confirmed"
            redirect(action: "newsite", params: params)
            return
        }
        def user = User.findById(session.user.id as Long)
        Site newsite = new Site(name: params.name, isPublic: params.sitetype, description: params.description)
        newsite.addToUsers(user)
        if (!newsite?.validate()) {
            flash.error = "Site does not been init correctly"
            log.error("Site does not been init correctly")
            redirect(action: "newsite", params: params)
            return
        }
        TagService.strToTagList(params.tags as String).each { newsite.addToTags(it) }
        if (newsite.validate()) {
            newsite.save()
            log.info("Site " + newsite.name + " has been saved successfully")
        } else {
            log.error("site " + newsite.name + " saved failed")
            flash.error = "site " + newsite.name + " saved failed"
            redirect(action: "newsite", params: params)
            return
        }
        flash.message = "Site " + newsite.name + " has been created successfully!"
        redirect(action: "mysites")
    }

    def settings(){

    }

    def maintenance(){

    }
}
