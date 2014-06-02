package vote

import grails.events.Listener

class ConfirmService {
    // Custom confirmed event prefix and namespace set to 'app' when requesting confirmation
    @Listener(topic = 'registration.confirmed' ,namespace = 'vote')
    def registrationConfirmed(info) {
        log.info "User ${info.email} successfully confirmed with application id data ${info.id}"
        def user = User.findByUsername(info.email as String)
        user.status = "confirmed"
        println(user.username)
        user.save()
        return [controller:'auth', action:'login']
    }
}
