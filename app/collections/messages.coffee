class Messages extends Backbone.Collection
  model: Backbone.Model

  url: '/messages'
  sync: require 'lib/cors_sync'

module.exports = Messages
