$ ->
  $('.repo-user-description').hide()

  $('.expand-description').click ->
    $(this).parents('li').find(".repo-user-description").toggle('fast')

  $('.add-tag-link').click (e) ->
    e.preventDefault()
    $(this).parent().next('.tagging').toggle('fast')

  $('.help-button').click (e) ->
    e.preventDefault()
    repoName = $(this).attr('data-repo')
    $.post("/needhelp/toggle", repo: repoName)

  $('.wanna-help-btn').click (e) ->
    e.preventDefault()
    repo_id = $(this).data('id')
    $.post("/wannahelp/toggle", repo: repo_id)

  $("#user-tabs li a").click (e) ->
    e.preventDefault()
    target = $(this).attr('href')

    $("#user-tabs li").removeClass('active')
    $(".tab-pane.active").removeClass('active')

    $(this).parent().addClass('active')
    $(target).addClass('active')

  $(".results-tooltip").tooltip()

  $(".results-tooltip").click (e) ->
    e.preventDefault()
