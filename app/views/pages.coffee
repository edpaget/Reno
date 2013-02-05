class Pages extends Backbone.View
  className: "pages"
  template: require './templates/pages'

  events:
    'click button.next' : 'nextPage'
    'click button.prev' : 'prevPage'

  initialize: (options) ->
    @parent = options.parent

  render: =>
    @$el.html @template()
    @

  nextPage: (e) =>
    console.log 'here'
    @parent.nextPage()

  prevPage: (e) =>
    @parent.prevPage()

module.exports = Pages
