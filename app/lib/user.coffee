class User extends Backbone.Events
  @current: null 

  @apiUrl: ->
    if location.port < 1024 then 'https://zoo-build.herokuapp.com' else 'http://localhost:3000'

  @fetchCurrent: ->
    fetcher = $.ajax "#{@apiUrl()}/users",
      dataType: 'json'
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.always @createUser
    fetcher.success -> User.trigger 'sign-in'
    fetcher

  @createUser: (response, status) ->
    if status is 'success'
      User.current = new User response
    else
      User.current = null

  constructor: (options) ->
    @name = options.name
    @id = options.id
    @apiToken = options.oauth_token
    @username = options.github_username

module.exports = User

