MessagesList = require 'views/messages_list'
User = require 'lib/user'

class HomeView extends Backbone.View
  template: require('./templates/home')

  initialize: ->
    @messagesList = new MessagesList

  loadCollection: =>
    @messagesList.loadCollection()

  render: =>
    @$el.html @template(User.current)
    @$('.messages').html @messagesList.render().el
    @

module.exports = HomeView
