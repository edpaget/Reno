AppView = require 'views/app_view'

class Router extends Backbone.Router
  routes:
    ''            : 'home'
    'add_project' : 'addProject'
    'add_project/:org' : 'addProject'

  initialize: ->
    @appView = new AppView { el: '#main' }

  home: ->
    @appView.render()

  addProject: (org) ->
    @appView.setAddProject org

module.exports = Router
