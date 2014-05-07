modules = {
    application {
        resource url:'js/application.js'
    }

    votejs {
        defaultBundle 'core-js'
        resource url: 'js/jquery-1.11.0.min.js'
        resource url: 'js/jquery.hotkeys.js'
        resource url: 'js/bootstrap-wysiwyg.js'
        resource url: 'js/google-code-prettify/prettify.js'
        resource url: 'js/bootstrap.js'
        resource url: 'js/holder.min.js'
        resource url: 'js/vote.js'
    }

    votecss{
        defaultBundle 'core-css'
        resource url: 'css/bootstrap.css'
        resource url: 'css/vote.css'
        resource url: 'css/bootstrap-theme.css'
        resource url: 'css/prettify.css'
        resource url: 'css/font-awesome.css'
    }
}