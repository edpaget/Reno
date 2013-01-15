class ProjectsItem extends Backbone.View
  template: require './templates/projects_item'
  className: 'project-item'

  initialize: (options) ->
    _.extend @, require('views/item_with_form')

  events:
    'click button.edit-project-btn' : 'toggleEdit'
    'click button.view-project-btn' : 'toggleView'

  toggleEdit: =>
    @showForm '.edit-project', 'button.edit-project-btn', {normal: 'Edit', cancel: 'Cancel'}

  toggleView: =>
    console.log @
    @showForm '.view-project', 'button.view-project-btn', {normal: 'View', cancel: 'Hide'}

  render: =>
    @$el.html @template(@model.toJSON())
    @

module.exports = ProjectsItem
