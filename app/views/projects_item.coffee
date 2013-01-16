ItemWithForm = require 'views/item_with_form'

class ProjectsItem extends ItemWithForm
  template: require './templates/projects_item'
  className: 'project-item'

  initialize: (options) ->
    _.extend @, require('views/item_with_form')

  events:
    'click button.edit-project-btn' : 'toggleEdit'
    'click button.view-project-btn' : 'toggleView'
    'click button.final-delete-btn' : 'destroy'
    'click button.final-deploy-btn' : 'deployProject'
    'submit' : 'updateProject'

  toggleEdit: =>
    @toggleView() if @$('.view-project').hasClass('active')
    @showForm '.edit-project', 'button.edit-project-btn', {normal: 'Edit', cancel: 'Cancel'}

  toggleView: =>
    @toggleEdit() if @$('.edit-project').hasClass('active')
    @showForm '.view-project', 'button.view-project-btn', {normal: 'View', cancel: 'Hide'}

  render: =>
    @$el.html @template(@model.toJSON())
    @

  destroy: =>
    @model.destroy()
    @undelegateEvents()
    @remove()

  deployProject: =>
    @model.deploy()

  updateProject: (e) =>
    e.preventDefault()
    @model.save
      s3_bucket: @$('[name="s3-bucket"]').val()
      branch: @$('[name="git-branch"]').val()
      build_step: @$('[name="build-step"]').val()
      build_dir: @$('[name="build-dir"]').val()

module.exports = ProjectsItem
