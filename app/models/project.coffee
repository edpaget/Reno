class Project extends Backbone.Model
  url: ->
    if _.isUndefined @id
      "/projects"
    else
      "/projects/#{@id}"

  sync: require 'lib/cors_sync'

  deploy: ->
    url = if location.port < 1024
      "https://zoo-build.herokuapp.com/projects/#{@id}/build"
    else
      "http://localhost:3000/projects/#{@id}/build"
    fetcher = $.ajax url,
      type: 'GET'
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.done (response) =>
      @trigger 'deploying'

module.exports = Project
