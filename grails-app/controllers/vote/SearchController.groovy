package vote

import org.grails.plugins.quickSearch.QuickSearchService

class SearchController {

    def quickSearchService = new QuickSearchService()

    def index() {}

    def search(){
        def user = User.findById(session.user.id as Long)
        def page = 1
        def query = params.query
        def usearchParams = [sort: 'lastUpdated', order: 'asc', max: 10, offset: 0]
        def usearchProperties = [firstname: "firstname",lastname:"lastname",username:"username"]
        def uautocompleteTemplate = 'Name: ${firstname} ${lastname} Email:${username}'
        def userStrList = quickSearchService.searchAutoComplete(domainClass: User, searchParams: usearchParams,
                searchProperties: usearchProperties, autocompleteTemplate: uautocompleteTemplate, query: query)
        def tsearchParams = [sort: 'lastUpdated', order: 'asc', max: 10, offset: 0]
        def tsearchProperties = [detail: "detail",title:"title"]
        def tautocompleteTemplate = 'Topic: ${title}'
        def topicstrlist = quickSearchService.searchAutoComplete(domainClass: Topic, searchParams: tsearchParams,
                searchProperties: tsearchProperties, autocompleteTemplate: tautocompleteTemplate, query: query)
        def topiclist = new ArrayList()
        def userlist = new ArrayList()
        topicstrlist.each {topiclist.add(Topic.findById(it.id))}
        userStrList.each {userlist.add(User.findById(it.id))}
        def hasMoreTopics = false
        def hasMoreUsers = false

        if(topiclist.size()>10){
            hasMoreTopics = true
            topiclist = topiclist.subList(0,10)
        }

        if(userlist.size()>10){
            hasMoreTopics = true
            topiclist = topiclist.subList(0,10)
        }

        return [user:user,topiclist:topiclist,userlist:userlist,query: query,area:params.area,page: page, hasMoreTopics: hasMoreTopics,hasMoreUsers:hasMoreUsers, query: params.query]
    }

    def moreTopics(){
        def user = User.findById(session.user.id as Long)
        def page = params.page as Integer
        def query = params.query
        def tsearchParams = [sort: 'lastUpdated', order: 'asc', max: 10, offset: 0]
        def tsearchProperties = [detail: "detail",title:"title"]
        def tautocompleteTemplate = 'Topic: ${title}'
        def topicstrlist = quickSearchService.searchAutoComplete(domainClass: Topic, searchParams: tsearchParams,
                searchProperties: tsearchProperties, autocompleteTemplate: tautocompleteTemplate, query: query)
        def topiclist = new ArrayList()
        topicstrlist.each {topiclist.add(Topic.findById(it.id))}
        def hasMoreTopics = false
        page++
        if(topiclist.size() > 10*page){
            topiclist = topiclist.subList(0,10*page)
            hasMoreTopics = true
        }
        render(view: '/topic/_plainTopicList',model: [user:user,topics: topiclist,page: page, hasMoreTopics: hasMoreTopics, query: query])
    }
}
