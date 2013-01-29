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

  setProject: (org, project_name) =>
    if _.isUndefined project_name
      @project = undefined
    else
      @project = @collection.find (project) =>
        console.log project.get('name'), "#{org}/#{project_name}"
        project.get('name') is "#{org}/#{project_name}"
      console.log @project

  render: =>
    subviews = new Array
    @$el.empty()
    if (_.isUndefined @project) and (not @collection.isEmpty())
      @collection.each (model) =>
        subviews.push new Item { model: model }
      _(subviews).each (subview) =>
        @$el.append subview.render().el
    else if _.isUndefined @project
      @$el.html ''
    else
      subview = new Item { model: @project }
      @$el.html subview.render().el
    @


module.exports = ProjectsList
