package vote

class SiteController {

    def index() {
        if (!params.id){
            redirect(action: "mysites")
        }else{
            def site = Site.findById(params.id)
            def user = User.findById(session.user.id as Long)
            def flag = site.users.contains(user)
            [site:site,accepted:flag]
        }

    }

    def mysites() {
        def user = User.findById(session.user.id as Long)
        def siteslist = user?.sites
        def trans = SiteTrans.findAll {type == "AddNewUser" && status == "Open" && targetUser == user}
        def appliedsites = new ArrayList()
        trans.each {appliedsites.add(it.site)}
        [siteslist:siteslist,appliedsites:appliedsites]
    }


    def newsite() {
    }


    def newtopic(){
        render(params.optionsRadios + " " + params.editorcontent)
    }

    def follow(){
        def site = Site.findById(params.id as Long)
        def user = User.findById(session.user.id as Long)
        if(user){
            if(user.sites.contains(site)){
                flash.message = "The site has been followed"
            }else{
                def sitetrans = new SiteTrans(type: "AddNewUser",status: "Open",site: site,targetUser: user)
                if (SiteTrans.find {type=="AddNewUser" && status=="Open" && targetUser == user && site == site}){
                    flash.message = "The apply has been sent before! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                }
                if(sitetrans){
                    sitetrans.save()
                    flash.message = "The apply has been sent! Please wait for the confirm."
                    redirect(action: "mysites")
                    return
                }else{
                    flash.error = "Follow Failed, Please Try Again"
                    redirect(action: "mysites")
                    return
                }
            }
        }else{
            flash.error = "Not login"
            redirect(controller: "auth",action: "login")
            return
        }
    }

    def create() {
        params.remove("_action_create")
        if (!params.get("agreed").equals("on")) {
            flash.error = "Not confirmed"
            redirect(action:"newsite",params: params)
            return
        }
        def user = User.findById(session.user.id as Long)
        Site newsite = new Site(name: params.name, isPublic: params.sitetype, description: params.description)
        newsite.addToUsers(user)
        if (!newsite?.validate()) {
            flash.error = "Site does not been init correctly"
            log.error("Site does not been init correctly")
            redirect(action:"newsite",params: params)
            return
        }
        String tagstr = params.tags as String
        if (tagstr != null && tagstr != "") {
            def tag = tagstr.split(" ")
            def tempTag
            tag.each {
                tempTag = Tag.findByName(it)
                if (tempTag) {
                    newsite.addToTags(tempTag)
                } else {
                    tempTag = new Tag(name: it)
                    if (tempTag?.validate()) {
                        tempTag.save()
                        log.info("Tag" + it + "Saved Successfully")
                        newsite.addToTags(tempTag)
                    } else {
                        tempTag.discard()
                        log.error("Tag" + it + " saved failed")
                        flash.error = "Tag" + it + " saved failed"
                        redirect(action:"newsite",params: params)
                        return
                    }
                }
            }
        }
        if (newsite.validate()) {
            newsite.save()
            log.info("Site " + newsite.name + " has been saved successfully")
        } else {
            log.error("site " + newsite.name + " saved failed")
            flash.error = "site " + newsite.name + " saved failed"
            redirect(action:"newsite",params: params)
            return
        }
        flash.message = "Site " + newsite.name + " has been created successfully!"
        redirect(action: "mysites")
    }
}
