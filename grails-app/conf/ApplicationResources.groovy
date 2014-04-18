modules = {
    application {
        resource url:'js/application.js'
    }

    votejs {
        defaultBundle 'core-js'

        resource url: 'js/jquery-1.11.0.min.js'
        resource url: 'js/bootstrap.js'
    }
}