Collection = require 'collections/projects'
Item = require 'views/projects_item'

class ProjectsList extends Backbone.View
  className: "projects-list"

  initialize: ->
    @collection = new Collection
    @collection.on 'add reset', @render

    User.on 'sign-in', @loadCollection
    @loadCollection()

  loadCollection: =>
    @collection.fetch() unless _.isNull User.current

  render: (id) =>
    subviews = new Array
    if _.isUndefined id
      @collection.each (model) =>
        subviews.push new Item { model: model }
      _(subviews).each (view) =>
        @$el.append view.render().el


module.exports = ProjectsList
