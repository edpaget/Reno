User = require 'lib/user'

class OrgSwitcher extends Backbone.View
  className: "org-switcher"
  template: require './templates/org_switcher'

  events:
    'click li' : 'switchOrg'

  initialize: (options) ->
    @parent = options.parent
    User.on 'sign-in', =>
      @selected = User.current.username
      User.current.on 'orgs-loaded', =>
        @orgs = User.current.orgs
        @render()

  render: =>
    options =
      orgs: @orgs
      selected: @selected
    @$el.html @template(options)
    @

  switchOrg: (e) =>
    e.preventDefault()
    console.log e
    org = e.currentTarget.dataset.org
    index = _(@org).indexOf org
    @org.slice index, 1
    @org.push @selected
    @selected = org
    @parent.switchOrg @selected
    @render()

module.exports = OrgSwitcher
