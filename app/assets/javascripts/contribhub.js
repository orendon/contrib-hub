$(function() {
  $('.repo-user-description').hide();

  $('.expand-description').click(function() {
    $(this).parents('li').find(".repo-user-description").toggle('fast')
  })

  $('.help-button').click(function(e) {
    var repoName = $(this).attr('data-repo')
    $.post("/repos/toggle_help", {repo: repoName});
    e.preventDefault();
  });
})
