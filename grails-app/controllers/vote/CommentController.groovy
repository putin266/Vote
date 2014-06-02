package vote

class CommentController {

    def newComment() {
        def user = User.findById(session.user.id as Long)
        def id = params.id as String
        if (id.contains('t')) {
            id = id.substring(1)
            def topic = Topic.findById(id.toLong())
            def comment = new Comment(comment: params.comment)
            topic.addToComments(comment)
            user.addToComments(comment)
            if (comment?.validate()) {
                topic.save()
                user.save()
            } else {
                flash.error = "System error:" + comment.errors
            }
            return render(template: "/comment/commentslist", model: [comments: topic.comments])
        } else if (id.contains('s')) {
            id = id.substring(1)
            def siteTrans = SiteTrans.findById(id.toLong())
            def comment = new Comment(comment: params.comment)
            siteTrans.addToComments(comment)
            user.addToComments(comment)
            if (comment?.validate()) {
                siteTrans.save()
                user.save()
            } else {
                flash.error = "System error:" + comment.errors
            }
            return render(template: "/comment/commentslist", model: [comments: siteTrans.comments])
        } else {
            def content = Content.findById(id.toLong())
            def comment = new Comment(comment: params.comment)
            content.addToComments(comment)
            user.addToComments(comment)
            if (comment?.validate()) {
                content.save()
                user.save()
            } else {
                flash.error = "System error:" + comment.errors
            }
            return render(template: "/comment/commentslist", model: [comments: content.comments])
        }

    }
}
