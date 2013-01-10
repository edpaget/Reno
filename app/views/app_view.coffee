class AppView extends Backbone.View
  noUserTemplate: require('./templates/sign_in')

  initialize: ->
    User.on 'sign-in', @render

  signInURL: ->
    if location.port < 1024 
      return "http://localhost:3000/auth/github"
    else
      return "https://zoo-build.herokuapp.com"

  render: =>
    if _.isNull User.current 
      @$el.html @noUserTemplate({url: @signInURL()})
    else

module.exports = AppView