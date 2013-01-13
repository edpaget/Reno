AppView = require 'views/app_view'

class Router extends Backbone.Router
  routes:
    '' : 'home'

  initialize: ->
    @appView = new AppView { el: '#main' }

  home: ->
    @appView.render()

module.exports = Router
