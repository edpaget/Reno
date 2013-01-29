SearchResults = require 'views/search_results'

class Search extends Backbone.View
  initialize: (options) ->
    @projectCollection = options.projectCollection
    @searchResults = new SearchResults

  events: 
    'keypress .search-query' : 'searchCollection'
    'blur' : 'stopSearch'

  render: (query) =>
    projectResults = @projectCollection.filter (project) ->
      not _.isEmpty(project.get('name').match query)
    @$el.append @searchResults.render(projectResults).el
    @

  searchCollection: (e) =>
    if e.which is 13
      @stopSearch e
    else
      query = @$('.search-query').val()
      @render new RegExp query

  stopSearch: (e) =>
    if e.type is 'focusout' or e.which is 13
      @searchResults.remove()


module.exports = Search