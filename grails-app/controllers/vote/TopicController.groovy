package vote

class TopicController {

    def index() {
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.id as Long)
        def isAdmin = topic.site.admins.contains(user)
        [topic: topic, taglist: topic.tags.sort {it.lastUpdated},isAdmin:isAdmin]
    }

    def addContent() {
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.topicid as Long)
        def flag = false
        if (topic.type == "question") {
            flag = true
        }
        def content = new Content(content: params.editorcontent, candidate: flag)
        user.addToContents(content)
        topic.addToContents(content)
        if (content.validate()) {
            user.save()
            topic.save()
        } else {
            flash.error = "System error:" + content.errors
        }
        redirect(action: "index", id: topic.id)
        return
    }

    def getCommentsSize() {
        def topic = Topic.findById(params.id as Long)
        render(topic.comments.size() + "&nbsp;Comments")
    }

    def delete(){
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.id as Long)
        def site = topic.site
        def sitetrans = new SiteTrans(detail: "Delete Topic", user: user, postscript: "Delete Topic", type: "DeleteTopic", status: "Open", site: site, targetDomain: "topic", targetId: topic.id.toString())
        if(!SiteTrans?.findByTypeAndStatusAndSiteAndTargetId("DeleteTopic","Open",site,topic.id)){
            if(sitetrans.validate()){
                sitetrans.save()
                flash.message = "Site Transaction created successfully!"
            }else{
                flash.error = "Error occurs"
            }
        }
        redirect(controller: "topic",action: "index",id: topic.id)
    }

    def upvote() {
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.id as Long)
        def vote = topic.votes.find { it.user.id == user.id }
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
            topic.addToVotes(vote)
            topic.save()
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (topic.votes.find{it.user.id == session.user.id})?.type ,candidate: topic,type: "topic"])
    }

    def downvote() {
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.id as Long)
        def vote = topic.votes.find { it.user.id == user.id }
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
            topic.addToVotes(vote)
            topic.save()
        }
        render(template: '/vote/sideVoteContent', model: [votetype: (topic.votes.find{it.user.id == session.user.id})?.type,candidate: topic,type: "topic"])
    }
}
