Application =
  initialize: ->
    @appView = new require('views/app_view') 
      el: '#main'
    @router = new require('lib/router')

module.exports = Application
