package vote

class ContentController {

    def getCommentsSize(){
        def content = Content.findById(params.id as Long)
        render(content.comments.size() + "&nbsp;Comments")
    }

    def upvote() {
        def user = User.findById(session.user.id as Long)
        def content = Content.findById(params.id as Long)
        def vote = content.votes.find { it.user.id == user.id }
        if (vote) {
            if (vote.type == "upvote") {
                vote.type = "novote"
                vote.save()
            }else {
                vote.type = "upvote"
                vote.save()
            }
        } else {
            vote = new Vote(type: "upvote", user: user)
            content.addToVotes(vote)
            content.save()
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (content.votes.find{it.user.id == session.user.id})?.type ,candidate: content,type: "content"])
    }

    def downvote() {
        def user = User.findById(session.user.id as Long)
        def content = Content.findById(params.id as Long)
        def vote = content.votes.find { it.user.id == user.id }
        if (vote) {
            if (vote.type == "downvote") {
                vote.type = "novote"
                vote.save()
            }else {
                vote.type = "downvote"
                vote.save()
            }
        } else {
            vote = new Vote(type: "downvote", user: user)
            content.addToVotes(vote)
            content.save()
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (content.votes.find{it.user.id == session.user.id})?.type,candidate: content,type: "content"])
    }
}
