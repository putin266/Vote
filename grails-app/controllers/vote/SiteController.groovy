package vote

class SiteController {

    def index() {
        redirect(action: "mysites")
    }

    def mysites() {
        def user = User.findById(session.user.id as Long)
        def siteslist = user?.sites
        [siteslist:siteslist]
    }

    def newsite() {

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
