Router = require 'lib/router'
User = require 'lib/user'

Application =
  initialize: ->
   @router = new Router
   Backbone.history.start()
   User.fetchCurrent()

module.exports = Application
