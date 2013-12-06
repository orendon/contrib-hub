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
    var repoName = $(this).attr('data-repo');
    $.post("/needhelp/toggle", { repo: repoName });
    e.preventDefault();
  });

  $('.wanna-help-btn').click(function(e) {
    var repo_id = $(this).data('id')
    $.post("/wannahelp/toggle", { repo: repo_id });
    e.preventDefault();
  });

  $(".repo-tags").tagit({
    availableTags: gon.tags
  });

  $("#user-tabs li a").click(function(e){
    e.preventDefault();
    target = $(this).attr('href');

    $("#user-tabs li").removeClass('active');
    $(".tab-pane.active").removeClass('active');

    $(this).parent().addClass('active')
    $(target).addClass('active');
  });

  $(".results-tooltip").click(function(e) { e.preventDefault(); });

})
