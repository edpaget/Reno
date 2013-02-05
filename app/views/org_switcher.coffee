User = require 'lib/user'

class OrgSwitcher extends Backbone.View
  className: "org-switcher"
  template: require './templates/org_switcher'

  events:
    'click li' : 'switchOrg'

  initialize: (options) =>
    @parent = options.parent
    User.on 'sign-in', =>
      @selected = User.current.username
      User.current.loadOrgs().done =>
        @orgs = User.current.orgs
        @render()

  render: =>
    options =
      orgs: @orgs
      selected: @selected
    console.log options
    @$el.html @template(options)
    @

  switchOrg: (e) =>
    e.preventDefault()
    org = e.currentTarget.dataset.org
    index = _(@orgs).indexOf org
    @orgs.slice index, 1
    @orgs.push @selected
    @selected = org
    @parent.switchOrg @selected
    @render()

module.exports = OrgSwitcher
