class Projects extends Backbone.Collection
  model: require 'models/projects'

  url: "/projects"

  sync: require 'lib/cors_sync'

module.exports = Projects
