class GithubProject extends Backbone.Model
  initialize: ->
    @truncateDesc() unless _.isUndefined @attributes['description']

  truncateDesc: ->
    desc = @attributes['description']
    name = @attributes['name']
    if (name.length + desc.length) > 90 
      length = 90 - name.length
      desc = "#{desc.slice(0,length)}..."
    @attributes['description'] = desc

module.exports = GithubProject
