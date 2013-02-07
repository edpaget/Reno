class User extends Backbone.Events
  @current: null 

  @apiUrl: "http://renoapi.zooniverse.org"

  @fetchCurrent: ->
    fetcher = $.ajax "#{@apiUrl}/users",
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.always @createUser
    fetcher.done -> User.trigger 'sign-in'
    fetcher

  @createUser: (response, status) ->
    if status is 'success'
      User.current = new User response
    else
      User.current = null

  constructor: (options) ->
    _.extend @, Backbone.Events
    @name = options.name
    @id = options.id
    @apiToken = options.oauth_token
    @username = options.github_username
    @image = options.image
    @orgs = new Array

  loadOrgs: =>
    fetcher = $.ajax "https://api.github.com/user/orgs?access_token=#{@apiToken}",
      dataType: 'json'
      crossDomain: true
    fetcher.done (response) =>
      @orgs.push org.login for org in response
      @trigger 'orgs-loaded'
    fetcher


module.exports = User

