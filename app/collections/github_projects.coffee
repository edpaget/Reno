User = require 'lib/user'

class GithubProjects extends Backbone.Collection
  model: require 'models/github_project'

  initialize: (models, options) ->
    @organization = options.organization
    @params =
      sort: 'pushed'
      page: 1
      per_page: 30

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

  url: ->
    if (_.isUndefined @organization) or (@organization is User.current?.username)
      "https://api.github.com/user/repos"
    else
      "https://api.github.com/orgs/#{@organization}/repos"

module.exports = GithubProjects