User = require 'lib/user'

class GithubProjectsItem extends Backbone.View
  template: require('./templates/gh_list_item')
  className: 'gh-project-item'
  tagName: 'div'

  events:
    'click button' : 'toggleForm'
    'submit' : 'newProject'

  initialize: (options) ->
    _.extend @, require('views/item_with_form')
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
      organization: if _.isUndefined @org then User.current.username else @org
    @model.toProject args


module.exports = GithubProjectsItem
