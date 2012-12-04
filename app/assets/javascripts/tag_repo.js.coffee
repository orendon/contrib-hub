jQuery ->
  new TagIt()

class TagIt
  
  constructor: ->
    @clickSaveHandler()
    
  clickSaveHandler: ->
    _self = this
    $('.tagging form > input').click (event) ->
      event.preventDefault()
      form = $(this).parent()
      tags = _self.getTags(form)
      repo_name = form.find(".hidden-repo-name").attr('value')
      _self.placeNewTags(form, tags)
      _self.sendPostRequest(tags, repo_name)
   
  getTags: (form) ->
    tags = []
    form.find('.tagit-label').each (index) ->
      tags.push $(this).text()
    tags

  placeNewTags: (form, tags) ->
    current = form.parent().prev()
    current.children().remove('.tag')
    current_tags = form.parent().prev()
    form.parent().slideUp(300)
    for tag in tags
      current_tags.prepend("<a href='#' class='tag'>#{tag}</a>")

  sendPostRequest: (tags, repo_name) ->
    $.post '/tagging/update_tags', { tag_list: tags, repo_name: repo_name }, (data) ->
      console.log data
    
@TagIt = TagIt

