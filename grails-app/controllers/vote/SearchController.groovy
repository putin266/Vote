package vote

class SearchController {

    def index() {}

    def search(){
        return [topiclist:Topic.list()]
    }
}
