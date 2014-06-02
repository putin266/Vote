package vote

class SiteController {

    def index() {
        if (!params.id) {
            redirect(action: "mysites")
        } else {
            def site = Site.findById(params.id)
            def user = User.findById(session.user.id as Long)
            def flag = site.users.contains(user)
            def topiclist = (site.topics.toList().sort { it.lastUpdated }).reverse()
            [site: site, accepted: flag, topiclist: topiclist]
        }
    }

    def mysites() {
        def user = User.findById(session.user.id as Long)
        def siteslist = user?.sites.toList()
        def trans = SiteTrans.findAll {
            type == "AddNewUser" && status == "Open" && targetDomain == "user" && targetId == user.id.toString()
        }
        def appliedsites = new ArrayList()
        trans.each { appliedsites.add(it.site) }
        siteslist = (siteslist.sort { it.lastUpdated }).reverse()
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
                def sitetrans = new SiteTrans(detail: "apply for follow", user: user, postscript: "Apply for enter", type: "AddNewUser", status: "Open", site: site, targetDomain: "user", targetId: user.id.toString())
                if (SiteTrans.find {
                    type == "AddNewUser" && status == "Open" && targetDomain == "user" && targetId == user.id.toString() && site == site
                }) {
                    flash.message = "The apply has been sent before! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                }
                if (sitetrans.validate()) {
                    site.addToTranses(sitetrans)
                    site.save()
                    user.addToSiteTranses(sitetrans)
                    user.save()
                    sitetrans.save()
                    flash.message = "The apply has been sent! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                } else {
                    flash.error = "Follow Failed, Please Try Again" + " Error:" + sitetrans.errors
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
            def votesettings = new SiteSetting(site: newsite,name: "minvote",value: 1)
            def bestsettings = new SiteSetting(site: newsite,name: "minbest",value: 1)
            newsite.addToSettings(votesettings)
            newsite.addToSettings(bestsettings)
            newsite.save()
            newsite.addToAdmins(user)
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

    def settings() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)
        def minbest = SiteSetting.findBySiteAndName(site,"minbest")?.value
        def minvote = SiteSetting.findBySiteAndName(site,"minvote")?.value
        [site: site, user: user, isAdmin: site.admins.contains(user),minbest:minbest,minvote:minvote]
    }

    def maintenance() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)
        def isAdmin = false
        if (site.admins.contains(user)) {
            isAdmin = true
        }
        if(isAdmin){
            def translist = SiteTrans.findAllBySiteAndStatus(site,"Open").toList().sort{it.dateCreated}
           render(view: "maint_admin",model:[site:site,translist:translist])
            return
        }else{
            return [site: site]
        }
    }

    def applyAdmin() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)
        def sitebest = SiteSetting.findBySiteAndName(site,"minbest").value.toInteger()
        def userbest = user.topics.findAll {
            topic ->
                (topic.votes.findAll {
                    it.type == "upvote"
                }).size() >= SiteSetting.findBySiteAndName(site,"minvote").value.toInteger()
        }.size() + user.contents.findAll {
            content ->
                (content.votes.findAll {
                    it.type == "upvote"
                }).size() >= SiteSetting.findBySiteAndName(site,"minvote").value.toInteger()
        }.size()
        if (userbest >= sitebest  ) {
            site.addToAdmins(user)
            site.save()
        }else{
            flash.error = "You apply can not be processed, your best topics are " + userbest + " which is lower than " + sitebest
        }
        redirect(controller: "site", action: "maintenance", id: site.id)
    }

    def changeBasicSettings() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)

        try {
            params.minbest.toInteger()
            params.minvote.toInteger()
        }catch(Exception e){
            flash.error = "Please input numbers"
            redirect(action: "settings", id: site.id)
        }

        def oldminbest = SiteSetting.findBySiteAndName(site, "minbest")
        def oldminvote = SiteSetting.findBySiteAndName(site, "minvote")
        def hasError = false
        def hasCreatedTrans = false
        if (oldminvote == null && (params.minbest != null)) {
            def minbesttrans = new SiteTrans(detail: params.minbest, type: "createSetting", status: "Open", targetDomain: "minbest", targetId: site.id, site: site, user: user)
            if (!(minbesttrans.validate() && minbesttrans.save())) {
                hasError = true
                println(minbesttrans.errors)
            }else{
                hasCreatedTrans = true
            }
        } else if (params.minbest != oldminbest.value) {
            def minbesttrans = new SiteTrans(detail: params.minbest, type: "changeSetting", status: "Open", targetDomain: "minbest", targetId: oldminbest.id, site: site, user: user)
            if (!(minbesttrans.validate() && minbesttrans.save())) {
                hasError = true
                println(minbesttrans.errors)
            }else{
                hasCreatedTrans = true
            }
        }
        if(oldminvote == null && (params.minvote != null) && !hasError){
            def minvotetrans = new SiteTrans(detail: params.minvote, type: "createSetting", status: "Open", targetDomain: "minvote", targetId: site.id, site: site, user: user)
            if (!(minvotetrans.validate() && minvotetrans.save())) {
                hasError = true
                println(minvotetrans.errors)
            }else{
                hasCreatedTrans = true
            }
        }else if ((params.minvote != oldminvote.value) && !hasError) {
            def minvotetrans = new SiteTrans(detail: params.minvote, type: "changeSetting", status: "Open", targetDomain: "minvote", targetId: oldminvote.id, site: site, user: user)
            if (!(minvotetrans.validate() && minvotetrans.save())) {
                hasError = true
                println(minvotetrans.errors)
            }else{
                hasCreatedTrans = true
            }
        }
        if (hasError) {
            flash.error = "Error occurs, please try again!"
        } else if(hasCreatedTrans) {
            flash.message = "Create transactions successfully!"
        }else{
            flash.message = "No changes is made"
        }
        redirect(action: "settings", id: site.id)
    }

}
