User = require 'lib/user'

class GithubProjects extends Backbone.Collections
  model: Backbone.Model

  sync: (method, model, options) ->
    baseURL = "#{_.result(model, 'url')}?access_token=#{User.current.apiToken}"
    options.crossDomain = true

    

module.exports = GithubProjects