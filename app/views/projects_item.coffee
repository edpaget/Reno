class ProjectsItem extends Backbone.View
  template: require './templates/projects_item'

  render: =>
    @$el.html @template(@model.toJSON())
    @

module.exports = ProjectsItem
