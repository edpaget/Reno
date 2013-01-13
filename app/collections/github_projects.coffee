User = require 'lib/user'

class GithubProjects extends Backbone.Collection
  model: require 'models/github_project'

  sync: (method, model, options) ->
    baseURL = "#{_.result(model, 'url')}?access_token=#{User.current.apiToken}"
    options.url = baseURL
    options.crossDomain = true
    return Backbone.sync(method, model, options)

  url: "https://api.github.com/users/repos"

module.exports = GithubProjects