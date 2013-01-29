AppView = require 'views/app_view'

class Router extends Backbone.Router
  routes:
    ''            : 'home'
    'add_project' : 'addProject'
    'add_project/:org' : 'addProject'
    'project' : 'project'
    'project/:org/:name' : 'project'

  initialize: ->
    @appView = new AppView { el: '#main' }

  home: ->
    @appView.setActive 'messagesList'

  addProject: (org) ->
    @appView.setAddProject org

  project: (org, name) ->
    console.log org, name
    @appView.setProject org, name

module.exports = Router
