AppView = require 'views/app_view'

class Router extends Backbone.Router
  routes:
    ''            : 'home'
    'add_project' : 'addProject'

  initialize: ->
    @appView = new AppView { el: '#main' }

  home: ->
    @appView.render()

  addProject: ->
    @appView.setActive 'ghProjectList'

module.exports = Router
