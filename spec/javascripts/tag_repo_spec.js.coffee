#= require tag_repo

describe "TagIt", ->

  it "gets the tags added to a repo", ->
    loadFixtures 'tagging_div'
    form = $('form')
    t = new TagIt()
    expect(t.getTags(form)).toContain("algorithms")

  it "places new tags for a given repo", ->
    loadFixtures 'repo_li'
    form = $("form[action='/tagging/update_tags']")
    current = $('.current-tags')
    tags = [ 'algorithms' ]
    t = new TagIt()
    t.placeNewTags(form, tags)
    expect(current).toContain('a.tag')
    
    
