class Projects extends Backbone.Collection
  model: require 'models/project'

  url: "/projects"

  sync: require 'lib/cors_sync'

module.exports = Projects
