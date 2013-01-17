class MessagesItem extends Backbone.View
  className: "message-item"
  template: require "./templates/messages_item"

  events:
    'click a.show-more' : 'showDetails'

  render: =>
    @$el.html @template(@model.toJSON())
    @

  showDetails: (e) =>
    e.preventDefault()
    link = @$('a.show-more')
    details = @$('p.details')
    if details.hasClass 'active'
      link.text 'Details'
      details.removeClass 'active'
    else
      link.text 'Hide'
      details.addClass 'active'

    


module.exports = MessagesItem
