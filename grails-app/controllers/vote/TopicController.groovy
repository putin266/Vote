package vote

class TopicController {

    def index() {
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.id as Long)
        [topic: topic,taglist:topic.tags]
    }

    def addContent(){
        def user = User.findById(session.user.id as Long)
        def topic = Topic.findById(params.topicid as Long)
        def flag = false
        if(topic.type == "question"){
            flag = true
        }
        def content = new Content(content: params.editorcontent,candidate: flag,createTime: TimeService.currentTime())
        user.addToContents(content)
        topic.addToContents(content)
        topic.lastUpdateTime = TimeService.currentTime()
        if(content.validate()){
            user.save()
            topic.save()
        }else{
            flash.error = "System error:" + content.errors
        }
        redirect(action: "index",id: topic.id)
    }

    def getCommentsSize(){
        def topic = Topic.findById(params.id as Long)
        render(topic.comments.size() + "&nbsp;Comments")
    }
}
