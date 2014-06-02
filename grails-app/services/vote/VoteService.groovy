package vote

import grails.transaction.Transactional

@Transactional
class VoteService {

    def static fireTransaction(SiteTrans trans) {
        switch (trans.type) {
            case "AddNewUser":
                addNewUser(trans)
                break
            case "changeSetting":
                changeSetting(trans)
                break
            case "createSetting":
                createSetting(trans)
                break

        }
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
            def setting = SiteSetting.findById(trans.targetId)
            setting.value = trans.detail
            setting.save()
            trans.status = "Closed"
            trans.save()
        }
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
    }
}
