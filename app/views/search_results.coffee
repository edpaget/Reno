class SearchResults extends Backbone.View
  className: 'search-results'
  templateProject: require('./templates/project_results')
  templateBox: require('./templates/box')

  render: (projects) =>
    @$el.html @templateBox()
    if _.isEmpty(projects)
      @$('.reno-project').append "<li> No Projects Found </li>"
    _(projects).each (project) =>
      @$('.reno-projects').append @templateProject(project.toJSON())
    @

module.exports = SearchResults
