package vote

class SiteTransController {

       def index(){
           def siteTrans = SiteTrans.findById(params.id as Long)
           def user = User.findById(session.user.id as Long)
           [siteTrans:siteTrans,user:user]
       }

    def upvote() {
        def user = User.findById(session.user.id as Long)
        def siteTrans = SiteTrans.findById(params.id as Long)

        if(siteTrans.status == "Open"){
            def vote = siteTrans.votes.find { it.user.id == user.id }
            if (vote) {
                if (vote.type == "upvote") {
                    vote.type = "novote"
                    vote.save()
                }else {
                    vote.type = "upvote"
                    vote.save()
                    VoteService.fireTransaction(siteTrans)
                }
            } else {
                vote = new Vote(type: "upvote", user: user)
                siteTrans.addToVotes(vote)
                siteTrans.save()
                VoteService.fireTransaction(siteTrans)
            }
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (siteTrans.votes.find{it.user.id == session.user.id})?.type ,candidate: siteTrans,type: "siteTrans"])
    }

    def downvote() {
        def user = User.findById(session.user.id as Long)
        def siteTrans = SiteTrans.findById(params.id as Long)

        if(siteTrans.status == "Open"){
            def vote = siteTrans.votes.find { it.user.id == user.id }
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
                siteTrans.addToVotes(vote)
                siteTrans.save()
            }
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (siteTrans.votes.find{it.user.id == session.user.id})?.type,candidate: siteTrans,type: "siteTrans"])
    }
}
