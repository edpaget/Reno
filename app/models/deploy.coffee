class Deploy extends Backbone.Model
  deploy: ->
    url = "http://renoapi.zooniverse.org/projects/#{@project_id}/deploys/#{@id}/build"
    fetcher = $.ajax url,
      type: 'GET'
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.done (response) =>
      @trigger 'deploying'

module.exports = Deploy
