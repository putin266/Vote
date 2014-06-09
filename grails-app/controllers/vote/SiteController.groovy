package vote

import com.lucastex.grails.fileuploader.FileUploaderService

class SiteController {

    def index() {
        def site = Site.findById(params.id)
        def user = User.findById(session.user.id as Long)
        if (!site) {
            redirect(action: "mysites")
        } else {
            def flag = site.users.contains(user)
            def topiclist = (site.topics.toList().sort { it.lastUpdated }).reverse()
            [site: site, accepted: flag, topiclist: topiclist,user:user]
        }
    }

    def mysites() {
        def user = User.findById(session.user.id as Long)
        if (!user) {
            redirect(controller: 'auth', action: 'login')
            return
        }
        def siteslist = user?.sites.toList()
        def trans = SiteTrans.findAll {
            type == "AddNewUser" && status == "Open" && targetDomain == "user" && targetId == user.id.toString()
        }
        def appliedsites = new ArrayList<Site>()
        trans.each { appliedsites.add(it.site) }
        siteslist = (siteslist.sort { it.lastUpdated }).reverse()
        [siteslist: siteslist, appliedsites: appliedsites]
    }


    def newsite() {
    }

    def newtopic() {
        def user = User.findById(session.user.id as Long)
        def site = Site.findById(params.siteid as Long)
        if (!(params.title && params.editorcontent)) {
            flash.error = "Title or Content can not be empty"
            redirect(action: 'index', id: site.id)
            return
        }

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
        def fs = new FileUploaderService()
        def user = User.findById(session.user.id as Long)
        Site newsite = new Site(name: params.name, isPublic: params.sitetype, description: params.description)
        newsite.addToUsers(user)
        if (!newsite?.validate()) {
            flash.error = "Site does not been init correctly"
            log.error("Site does not been init correctly")
            redirect(action: "newsite", params: params)
            return
        }
        def logo
        if (!request.getFile('logo').isEmpty()) {
            try {
                logo = fs.saveFile("logo", request.getFile("logo"), "logo" + System.currentTimeMillis(), new Locale("en"))
            } catch (Exception e) {
                flash.error = e.message
                redirect(action: "newsite", params: params)
                return
            }
        }

        newsite.logo = logo
        TagService.strToTagList(params.tags as String).each { newsite.addToTags(it) }
        if (newsite.validate()) {
            newsite.save()
            def votesettings = new SiteSetting(site: newsite, name: "minvote", value: 1)
            def bestsettings = new SiteSetting(site: newsite, name: "minbest", value: 1)
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
        def minbest = SiteSetting.findBySiteAndName(site, "minbest")?.value
        def minvote = SiteSetting.findBySiteAndName(site, "minvote")?.value

        def AddNewUser = SiteSetting.findBySiteAndName(site, "AddNewUser")?.value
        def changeSetting = SiteSetting.findBySiteAndName(site, "changeSetting")?.value
        def createSetting = SiteSetting.findBySiteAndName(site, "createSetting")?.value
        def DeleteUser = SiteSetting.findBySiteAndName(site, "DeleteUser")?.value
        def DeleteTopic = SiteSetting.findBySiteAndName(site, "DeleteTopic")?.value
        def DeleteContent = SiteSetting.findBySiteAndName(site, "DeleteContent")?.value
        def ChangeRules = SiteSetting.findBySiteAndName(site, "ChangeRules")?.value
        def ChangeName = SiteSetting.findBySiteAndName(site, "ChangeName")?.value
        def ChangeType = SiteSetting.findBySiteAndName(site, "ChangeType")?.value
        def ChangeDesc = SiteSetting.findBySiteAndName(site, "ChangeDesc")?.value
        def ChangeTags = SiteSetting.findBySiteAndName(site, "ChangeTags")?.value
        def ChangeLogo = SiteSetting.findBySiteAndName(site, "ChangeLogo")?.value

        [ChangeLogo:ChangeLogo,ChangeTags:ChangeTags,ChangeDesc:ChangeDesc,ChangeType:ChangeType,ChangeName:ChangeName,ChangeRules:ChangeRules,DeleteContent:DeleteContent,DeleteTopic:DeleteTopic,DeleteUser:DeleteUser,createSetting:createSetting,site: site, user: user, isAdmin: site.admins.contains(user), minbest: minbest, minvote: minvote, AddNewUser: AddNewUser, changeSetting: changeSetting]
    }

    def maintenance() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)

        if (!site) {
            redirect(controller: 'site', action: 'mysites')
            return
        }
        def isAdmin = false
        if (site.admins.contains(user)) {
            isAdmin = true
        }
        if (isAdmin) {
            def translist = SiteTrans.findAllBySiteAndStatus(site, "Open").toList().sort { it.dateCreated }
            render(view: "maint_admin", model: [site: site, translist: translist])
            return
        } else {
            return [site: site]
        }
    }

    def applyAdmin() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)

        if ((site.users.size() == 1) && (site.users[0].equals(user))) {
            site.addToAdmins(user)
            site.save()
            redirect(controller: "site", action: "maintenance", id: site.id)
            return
        }

        def sitebest = SiteSetting.findBySiteAndName(site, "minbest").value.toInteger()
        def userbest = user.topics.findAll {
            topic ->
                (topic.votes.findAll {
                    it.type == "upvote"
                }).size() >= SiteSetting.findBySiteAndName(site, "minvote").value.toInteger()
        }.size() + user.contents.findAll {
            content ->
                (content.votes.findAll {
                    it.type == "upvote"
                }).size() >= SiteSetting.findBySiteAndName(site, "minvote").value.toInteger()
        }.size()
        if (userbest >= sitebest) {
            site.addToAdmins(user)
            site.save()
        } else {
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
        } catch (Exception e) {
            flash.error = "Please input numbers"
            redirect(action: "settings", id: site.id)
        }

        def hasError = false

        hasError = SiteService.changeBasicSettings("minbest", SiteSetting.findBySiteAndName(site, "minbest"), params.minbest, site, user)
        hasError = SiteService.changeBasicSettings("minvote", SiteSetting.findBySiteAndName(site, "minvote"), params.minvote, site, user)

        hasError = SiteService.changeBasicSettings("ChangeLogo", SiteSetting.findBySiteAndName(site, "ChangeLogo"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("ChangeTags", SiteSetting.findBySiteAndName(site, "ChangeTags"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("ChangeDesc", SiteSetting.findBySiteAndName(site, "ChangeDesc"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("ChangeType", SiteSetting.findBySiteAndName(site, "ChangeType"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("ChangeName", SiteSetting.findBySiteAndName(site, "ChangeName"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("ChangeRules", SiteSetting.findBySiteAndName(site, "ChangeRules"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("DeleteContent", SiteSetting.findBySiteAndName(site, "DeleteContent"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("DeleteTopic", SiteSetting.findBySiteAndName(site, "DeleteTopic"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("DeleteUser", SiteSetting.findBySiteAndName(site, "DeleteUser"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("createSetting", SiteSetting.findBySiteAndName(site, "createSetting"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("AddNewUser", SiteSetting.findBySiteAndName(site, "AddNewUser"), params.minvote, site, user)
        hasError = SiteService.changeBasicSettings("changeSetting", SiteSetting.findBySiteAndName(site, "changeSetting"), params.minvote, site, user)


        if (hasError) {
            flash.error = "Error occurs, please try again!"
        } else {
            flash.message = "Apply changes successfully!"
        }
        redirect(action: "settings", id: site.id)
    }

    def changeRules() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)

        if (params.editorcontent != site.rules) {
            def trans = new SiteTrans(type: "ChangeRules", status: "Open", targetDomain: "site", targetId: site.id, detail: params.editorcontent, postscript: "", site: site, user: user)
            if (trans.validate()) {
                trans.save()
                flash.message = "Change apply has been sent"
            } else {
                flash.error = "Save Failed"
            }
            redirect(action: 'settings', id: site.id)
        }
    }

    def saveProfile() {
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)

        if (params.oldsitetype != params.sitetype) {
            def trans = new SiteTrans(type: "ChangeType", status: "Open", targetDomain: "site", targetId: site.id, detail: params.sitetype, postscript: "", site: site, user: user)
            if (trans.validate()) {
                trans.save()
                flash.message = "Change apply has been sent"
            } else {
                flash.error = "Save Failed"
            }
        }

        if (params.name != site.name) {
            def trans = new SiteTrans(type: "ChangeName", status: "Open", targetDomain: "site", targetId: site.id, detail: params.name, postscript: "", site: site, user: user)
            if (trans.validate()) {
                trans.save()
                flash.message = "Change apply has been sent"
            } else {
                flash.error = "Save Failed"
            }
        }

        if (params.description != site.description) {
            def trans = new SiteTrans(type: "ChangeDesc", status: "Open", targetDomain: "site", targetId: site.id, detail: params.description, postscript: "", site: site, user: user)
            if (trans.validate()) {
                trans.save()
                flash.message = "Change apply has been sent"
            } else {
                flash.error = "Save Failed"
            }
        }

        if (params.tags != params.oldtags) {
            def trans = new SiteTrans(type: "ChangeTags", status: "Open", targetDomain: "site", targetId: site.id, detail: params.tags, postscript: "", site: site, user: user)
            if (trans.validate()) {
                trans.save()
                flash.message = "Change apply has been sent"
            } else {
                flash.error = "Save Failed"
            }
        }

        if (!request.getFile('logo').isEmpty()) {
            def fs = new FileUploaderService()
            def logo
            try {
                logo = fs.saveFile("logo", request.getFile("logo"), "logo" + System.currentTimeMillis(), new Locale("en"))
                def trans = new SiteTrans(type: "ChangeLogo", status: "Open", targetDomain: "site", targetId: site.id, detail: logo.id, postscript: "", site: site, user: user)
                if (trans.validate()) {
                    trans.save()
                    flash.message = "Change apply has been sent"
                } else {
                    flash.error = "Save Failed"
                }
            } catch (Exception e) {
                flash.error = e.message
            }
        }

        redirect(action: 'settings', id: site.id)
    }

}
