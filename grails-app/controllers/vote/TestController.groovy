package vote

import com.grailsrocks.emailconfirmation.EmailConfirmationService

class TestController {

    def testEmail() {
        def emailservice = new EmailConfirmationService()
        emailservice.sendConfirmation(
                to:"76368993@qq.com",
                subject:"Confirm test",
                event: "registration",
                eventNamespace: "vote"
        )
        redirect(controller: "user",action: "index",id: session.user.id)
    }
}
