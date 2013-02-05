SearchResults = require 'views/search_results'

class Search extends Backbone.View
  initialize: (options) ->
    @projectCollection = options.projectCollection
    @searchResults = new SearchResults

  events: 
    'keyup .search-query' : 'searchCollection'
    'blur .search-query' : 'stopSearch'

  render: (projectResults) =>
    @$el.append @searchResults.render(projectResults).el
    @

  searchCollection: (e) =>
    if e.which is 13
      @stopSearch e
    else
      query = new RegExp e.currentTarget.value
      results = @projectCollection.filter (project) ->
        not _.isEmpty(project.get('name').toLowerCase().match query)
      @render(results)

  stopSearch: (e) =>
    if e.type is 'focusout' or e.which is 13
      setTimeout @searchResults.remove, 10

module.exports = Search