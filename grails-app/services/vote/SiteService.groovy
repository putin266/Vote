package vote

import grails.transaction.Transactional

@Transactional
class SiteService {
    def static boolean changeBasicSettings(String key,SiteSetting oldSetting,String newvalue,Site site,User user){
        def hasError = false
        if(!oldSetting && newvalue){
            def trans = new SiteTrans(detail: newvalue, type: "createSetting", status: "Open", targetDomain: key, targetId: site.id, site: site, user: user)
            if (!(trans.validate() && trans.save())) {
                hasError = true
            }
        }else if (oldSetting.value != newvalue) {
            def trans = new SiteTrans(detail: newvalue, type: "changeSetting", status: "Open", targetDomain: key, targetId: oldSetting.id, site: site, user: user)
            if (!(trans.validate() && trans.save())) {
                hasError = true
            }
        }
        return hasError
    }
}
