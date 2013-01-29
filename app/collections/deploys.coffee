class Deploys extends Backbone.Collection
  model: require 'models/deploy'

  initialize: (models, options) ->
    @projectId = options.projectId

  url: =>
    "/projects/#{@projectId}/deploys"

  sync: require 'lib/cors_sync'


module.exports = Deploys
