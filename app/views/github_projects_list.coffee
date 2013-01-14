Collection = require 'collections/github_projects'
OrgSwitcher = require 'views/org_switcher'
GhItem = require 'views/github_projects_item'
User = require 'lib/user'

class GithubProjectsList extends Backbone.View
  className: 'gh-projects-list'
  tagName: 'div'

  initialize: ->
    @collection = new Collection [], {}
    @orgSwitcher = new OrgSwitcher { parent: @ }

    User.on 'sign-in', @loadCollection
    @collection.on 'add reset', @render

    @loadCollection() unless _.isNull User.current

  loadCollection: =>
    @collection.fetch().done (data, textStatus, xhr) ->
      console.log xhr.getResponseHeader('Link')

  render: =>
    list = new Array
    @collection.each (model) =>
      list.push new GhItem({model: model})
    _(list).each (item) =>
      @$el.append item.render().el
    @

module.exports = GithubProjectsList