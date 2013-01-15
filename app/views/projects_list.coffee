Collection = require 'collections/projects'
Item = require 'views/projects_item'
User = require 'lib/user'

class ProjectsList extends Backbone.View
  className: "projects-list"

  initialize: ->
    @collection = new Collection
    @collection.on 'add reset', @render

    User.on 'sign-in', @loadCollection
    @loadCollection()

  loadCollection: =>
    @collection.fetch() unless _.isNull User.current

  setProject: (project_name) =>
    if _.isUndefined project_name
      @project = undefined
    else
      @project = @find (project) =>
        project.name is project_name

  render: =>
    subviews = new Array
    @$el.empty()
    if _.isUndefined @project
      @collection.each (model) =>
        subviews.push new Item { model: model }
      _(subviews).each (subview) =>
        @$el.append subview.render().el
    else
      subview = new Item { model: @project }
      @$el.html subview.render().el
    @


module.exports = ProjectsList
