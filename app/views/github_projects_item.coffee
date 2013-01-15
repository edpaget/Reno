User = require 'lib/user'

class GithubProjectsItem extends Backbone.View
  template: require('./templates/gh_list_item')
  className: 'gh-project-item'
  tagName: 'div'

  events:
    'click button' : 'showForm'
    'submit' : 'newProject'

  initialize: (options) ->
    @org = options.org

  render: =>
    @$el.html @template(@model.toJSON())
    @

  showForm: =>
    form = @$('.new-project-form')
    button = @$('button.add-project')
    if form.hasClass 'active'
      button.text 'Add Project'
      button.removeClass 'btn-danger'
      button.addClass 'btn-primary'
    else
      button.text 'Cancel'
      button.removeClass 'btn-primary'
      button.addClass 'btn-danger'
    form.toggleClass 'active'

  newProject: (e) =>
    e.preventDefault()
    args =
      s3_bucket: @$('[name="s3-bucket"]').val()
      git_branch: @$('[name="git-branch"]').val()
      build_step: @$('[name="build-step"]').val()
      build_dir: @$('[name="build-dir"]').val()
      organization: if _.isUndefined @org then User.current.username else @org
    @model.toProject args


module.exports = GithubProjectsItem
