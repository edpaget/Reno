Collection = require 'collections/github_projects'
OrgSwitcher = require 'views/org_switcher'
Pages = require 'views/pages'
GhItem = require 'views/github_projects_item'
User = require 'lib/user'

class GithubProjectsList extends Backbone.View
  className: 'gh-projects-list'
  tagName: 'div'
  template: require './templates/gh_list'

  initialize: ->
    @collection = new Collection [], {}
    @$el.html @template()

    @orgSwitcher = new OrgSwitcher { parent: @, el: @$('.org-switcher') } unless @orgSwitcher
    @pages = new Pages { parent: @, el: @$('.pages')}
    @orgSwitcher.render()
    @pages.render()

    User.on 'sign-in', @loadCollection
    @collection.on 'add reset', @render

    @loadCollection() 

  loadCollection: =>
    unless _.isNull User.current
      @collection.fetch().done (data, textStatus, xhr) ->
        console.log xhr.getResponseHeader('Link')

  switchOrg: (org) =>
    @org = org
    @collection.organization = org
    @collection.fetch()

  prevPage: =>
    @collection.params.page -= 1
    @loadCollection()

  nextPage: =>
    console.log 'here'
    @collection.params.page += 1
    @loadCollection()

  render: =>
    list = new Array
    @$('.items').empty()

    @collection.each (model) =>
      list.push new GhItem({model: model, org: @org})
    _(list).each (item) =>
      @$('.items').append item.render().el
    @

module.exports = GithubProjectsList