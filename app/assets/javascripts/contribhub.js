$(function() {
  $('.repo-user-description').hide();

  $('.expand-description').click(function() {
    $(this).parents('li').find(".repo-user-description").toggle('fast')
  });

  $('.add-tag-link').click(function(e) {
    e.preventDefault();
    $(this).parent().next('.tagging').toggle('fast');
  });

  $('.help-button').click(function(e) {
    var repoName = $(this).attr('data-repo')
    $.post("/repos/toggle_need_help", { repo: repoName });
    e.preventDefault();
  });

  $(".repo-tags").tagit({
    availableTags: gon.tags
  });

})
