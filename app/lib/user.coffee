class User extends Backbone.Events
  @current: null 

  @apiUrl: ->
    if location.port < 1024 then 'https://zoo-build.herokuapp.com' else 'http://localhost:3000'

  @fetchCurrent: ->
    fetcher = $.ajax "#{@apiUrl()}/users",
      crossDomain: true
      xhrFields:
        withCredentials: true
    fetcher.always @createUser
    fetcher.success -> User.trigger 'sign-in'
    fetcher

  @createUser: (response, status) ->
    User.current = if status is 'success'
      new User response
    else
      null

  constructor: (options) ->
    @name = options.name
    @id = options.id
    @apiToken = options.oauth_token

module.exports = User

