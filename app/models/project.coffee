class Project extends Backbone.Model
  url: '/projects'

  sync: require 'lib/cors_sync'

module.exports = Project
