package vote

import grails.transaction.Transactional

@Transactional
class TimeService {

    def static currentTime() {
        return new Date(System.currentTimeMillis())
    }
}
