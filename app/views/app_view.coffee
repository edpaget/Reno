User = require 'lib/user'
GhProjectsList = require 'views/github_projects_list'
ProjectsList = require 'views/projects_list'

class AppView extends Backbone.View
  noUserTemplate: require('./templates/sign_in')
  homeTemplate: require('./templates/home')

  initialize: ->
    @active = new Backbone.View
    @ghProjectList = new GhProjectsList
    @projectList = new ProjectsList
    User.on 'sign-in', @render

  signInURL: ->
    if location.port > 1024 
      return "http://localhost:3000/auth/github"
    else
      return "https://zoo-build.herokuapp.com"

  setActive: (view) ->
    if _.isUndefined view
      @active = new Backbone.View
    else
      @active = @[view]
    @render()

  setAddProject: (org) ->
    @ghProjectList.switchOrg org unless _.isUndefined org
    @active = @ghProjectList
    @render()

  setProject: (project_name) ->
    @projectList.setProject project_name
    @active = @projectList
    @render()

  render: =>
    if _.isNull User.current 
      @$el.html @noUserTemplate({url: @signInURL()})
    else
      @$el.html @homeTemplate()
      @$('#content').html @active.render().el
    @

module.exports = AppView