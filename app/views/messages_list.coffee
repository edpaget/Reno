Collection = require 'collections/messages'
MessageItem = require 'views/messages_item'
User = require 'lib/user'

class MessagesList extends Backbone.View
  className: "messages-list"

  initialize: ->
    @collection = new Collection
    @collection.on 'add reset', @render
    User.on 'sign-in', @loadCollection

  loadCollection: =>
    @collection.fetch() unless _.isNull User.current

  render: =>
    @$el.empty()
    subviews = new Array
    @collection.each (model) =>
      subviews.push new MessageItem {model: model}
    _(subviews).each (view) =>
      @$el.append view.render().el
    @

  
module.exports = MessagesList
