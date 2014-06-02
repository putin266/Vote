package vote

import org.grails.plugins.quickSearch.QuickSearchService

class SearchController {

    def quickSearchService = new QuickSearchService()

    def index() {}

    def search(){
        def query = params.query
        def usearchParams = [sort: 'lastUpdated', order: 'asc', max: 10, offset: 0]
        def usearchProperties = [firstname: "firstname",lastname:"lastname",username:"username"]
        def uautocompleteTemplate = 'Name: ${firstname} ${lastname} Email:${username}'
        def userlist = quickSearchService.searchAutoComplete(domainClass: User, searchParams: usearchParams,
                searchProperties: usearchProperties, autocompleteTemplate: uautocompleteTemplate, query: query)
        def tsearchParams = [sort: 'lastUpdated', order: 'asc', max: 10, offset: 0]
        def tsearchProperties = [detail: "detail",title:"title"]
        def tautocompleteTemplate = 'Topic: ${title}'
        def topicstrlist = quickSearchService.searchAutoComplete(domainClass: Topic, searchParams: tsearchParams,
                searchProperties: tsearchProperties, autocompleteTemplate: tautocompleteTemplate, query: query)
        def topiclist = new ArrayList()
        topicstrlist.each {topiclist.add(Topic.findById(it.id))}
        return [topiclist:topiclist,userlist:userlist,query: query,area:params.area]
    }
}
