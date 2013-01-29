Collection = require 'collections/deploys'

class Deploys extends Backbone.View
  tagName: 'div'
  className: 'project-deploys'
  template: require './templates/deploy'

  initialize: (options) ->
    @collection = new Collection [], {projectId: options.projectId}
    @collection.on 'add reset', @render

  loadCollection: =>
    @collection.fetch()

  render: =>
    @$el.empty()
    @collection.each (deploy) =>
      @$el.append @template(deploy.toJSON())
    @

module.exports = Deploys
