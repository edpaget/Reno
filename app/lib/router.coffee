AppView = require 'views/app_view'

class Router extends Backbone.Router
  routes:
    ''            : 'home'
    'add_project' : 'addProject'
    'add_project/:org' : 'addProject'
    'project' : 'project'
    'project/:project_name' : 'project'

  initialize: ->
    @appView = new AppView { el: '#main' }

  home: ->
    @appView.render()

  addProject: (org) ->
    @appView.setAddProject org

  project: (name) ->
    @appView.setProject name

module.exports = Router
