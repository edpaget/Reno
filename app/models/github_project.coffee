Project = require 'models/project'

class GithubProject extends Backbone.Model
  initialize: ->
    @truncateDesc() unless _.isUndefined @attributes['description']

  toProject: (args) =>
    attributes =
      name: @get('name')
      url: @get('html_url')
    _.extend attributes, args
    project = new Project attributes
    project.save()

  truncateDesc: ->
    desc = @attributes['description']
    name = @attributes['name']
    if (name.length + desc.length) > 90 
      length = 90 - name.length
      desc = "#{desc.slice(0,length)}..."
    @attributes['description'] = desc

module.exports = GithubProject
