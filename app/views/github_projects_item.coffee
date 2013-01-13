class GithubProjectsItem extends Backbone.View
  template: require('./templates/gh_list_item')
  className: 'gh-project-item row'
  tagName: 'div'

  events:
    'click button' : 'subscribe'

  render: =>
    @$el.html @template(@model.toJSON())
    @

  subscribe: =>
    @model


module.exports = GithubProjectsItem
