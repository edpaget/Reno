User = require 'lib/user'

class GithubProjects extends Backbone.Collection
  model: require 'models/github_project'

  initialize: ->
    @params =
      sort: 'pushed'
      page: 1
      per_page: 10

  sync: (method, model, options) ->
    baseURL = "#{_.result(model, 'url')}?access_token=#{User.current.apiToken}"
    baseURL = @addParams baseURL
    options.url = baseURL
    options.crossDomain = true
    return Backbone.sync(method, model, options)

  addParams: (url) ->
    for key, value of @params
      url = "#{url}&#{key}=#{value}"
    url

  url: "https://api.github.com/user/repos"

module.exports = GithubProjects