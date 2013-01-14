User = require 'lib/user'

class OrgSwitcher extends Backbone.View
  className: "org-switcher"
  template: require './templates/org_switcher'

  initialize: (options) ->
    @parent = options.parent
    @selected = User.current.username
    @orgs = User.current.orgs
    User.on 'orgs-loaded', @render

  render: =>
    options =
      orgs: @orgs
      selected: @selected
    @$el.html template(options)
    @

module.exports = OrgSwitcher
