User = require 'lib/user'
ItemWithForm = require 'views/item_with_form'

class GithubProjectsItem extends ItemWithForm
  template: require('./templates/gh_list_item')
  className: 'gh-project-item'
  tagName: 'div'

  events:
    'click button' : 'toggleForm'
    'submit' : 'newProject'

  initialize: (options) ->
    @org = options.org

  render: =>
    @$el.html @template(@model.toJSON())
    @

  toggleForm: =>
    @showForm  '.new-project-form', 'button.add-project', {normal: 'Add Project', cancel: 'Cancel'}

  newProject: (e) =>
    e.preventDefault()
    args =
      s3_bucket: @$('[name="s3-bucket"]').val()
      branch: @$('[name="git-branch"]').val()
      build_step: @$('[name="build-step"]').val()
      build_dir: @$('[name="build-dir"]').val()
      webhook: @$('input[type="checkbox"]').prop('checked')
      project_type: @$('.project-type').val()
      organization: if _.isUndefined @org then User.current.username else @org
    @model.toProject args


module.exports = GithubProjectsItem
