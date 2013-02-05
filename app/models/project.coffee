class Project extends Backbone.Model
  url: ->
    if _.isUndefined @id
      "/projects"
    else
      "/projects/#{@id}"

  sync: require 'lib/cors_sync'

  deploy: ->
    url = "http://renoapi.zooniverse.org/projects/#{@id}/build"
    fetcher = $.ajax url,
      type: 'GET'
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.done (response) =>
      @trigger 'deploying'

  enqueueLastCommit: ->
    url = "http://renoapi.zooniverse.org/projects/#{@id}/last_commit"
    fetcher = $.ajax url, 
      type: 'GET'
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.done (response) =>
      @trigger 'queueing'

module.exports = Project
