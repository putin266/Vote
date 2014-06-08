package vote

import grails.transaction.Transactional

@Transactional
class VoteService {

    def static boolean fireTransaction(SiteTrans trans) {
        def flag = false
        switch (trans.type) {
            case "AddNewUser":
                flag = addNewUser(trans)
                break
            case "changeSetting":
                flag = changeSetting(trans)
                break
            case "createSetting":
                flag = createSetting(trans)
                break
            case "DeleteUser":
                flag = deleteUser(trans)
                break
            case "DeleteTopic":
                flag = deleteTopic(trans)
                break
            case "DeleteContent":
                flag = deleteContent(trans)
                break
            case "ChangeRules":
                flag = changeRules(trans)
                break
        }
        return flag
    }

    def private static changeRules(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }
        if(ispass){
            trans.site.rules = trans.detail
            trans.site.save()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

    def private static deleteContent(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            def content = Content.findById(trans.targetId as Long)
            content.delete()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

    def private static deleteTopic(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            def topic = Topic.findById(trans.targetId as Long)
            topic.delete()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

    def private static deleteUser(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            def targetUser = User.findById(trans.targetId as Long)
            targetUser.removeFromSites(trans.site)

            if(trans.site.admins.contains(targetUser)){
                trans.site.removeFromAdmins(targetUser)
                SiteTrans.findAllBySiteAndUser(trans.site,trans.user).each {it.delete()}
            }
            trans.site.save()
            targetUser.save()
            trans.status = "Closed"
            trans.save()
            if(trans.site.users.size() == 0){
                trans.site.delete()
            }
        }
        return ispass
    }

    def private static addNewUser(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            trans.site.addToUsers(trans.user)
            trans.site.save()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

    def  private static changeSetting(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            def setting = SiteSetting.findById(trans.targetId as Long)
            setting.value = trans.detail
            setting.save()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

    def  private static createSetting(SiteTrans trans){
        def ispass = false
        def upvotes = (trans.votes.findAll {it.type == "upvote"}).size()
        if (upvotes == trans.site.admins.size()){
            ispass = true
        }else if (upvotes >= SiteSetting.findBySiteAndName(trans.site,"")?.value?.toInteger()){
            ispass = true
        }

        if(ispass){
            def setting = new SiteSetting(site: trans.site,name: trans.targetDomain,value: trans.detail)
            trans.site.addToSettings(setting)
            trans.site.save()
            trans.status = "Closed"
            trans.save()
        }
        return ispass
    }

}
