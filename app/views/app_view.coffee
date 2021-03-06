User = require 'lib/user'
HomeView = require 'views/home_view'
GhProjectsList = require 'views/github_projects_list'
ProjectsList = require 'views/projects_list'
Search = require 'views/search'

class AppView extends Backbone.View
  noUserTemplate: require('./templates/sign_in')
  homeTemplate: require('./templates/layout')

  initialize: ->
    @home = new HomeView
    @ghProjectList = new GhProjectsList
    @projectList = new ProjectsList
    @active = @messagesList
    User.on 'sign-in', @render

  signInURL: ->
    if location.port > 1024 
      return "http://localhost:3000/auth/github"
    else
      return "http://renoapi.zooniverse.org/auth/github"

  setActive: (view) ->
    if _.isUndefined view
      @active = new Backbone.View
    else
      @active = @[view]
      @active.loadCollection()
    @render()

  setAddProject: (org) ->
    @ghProjectList.switchOrg org unless _.isUndefined org
    @ghProjectList.loadCollection()
    @active = @ghProjectList
    @render()

  setProject: (org, project_name) ->
    @projectList.setProject org, project_name
    @projectList.loadCollection()
    @active = @projectList
    @render()

  render: =>
    console.log _.isUndefined(User.current)
    @$el.html @homeTemplate()
    @search = new Search 
      projectCollection: @projectList.collection
      el: '.navbar-search'
    if _.isNull User.current 
      @$('#content').html @noUserTemplate({url: @signInURL()})
    else
      @$('#content').html @active.render().el
    @

module.exports = AppView