package vote

class ContentController {

    def getCommentsSize(){
        def content = Content.findById(params.id as Long)
        render(content.comments.size() + "&nbsp;Comments")
    }
}
