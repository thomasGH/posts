$(document).ready(function() {
	$('a.edit_post_title_link').click(function() {
		
    var post_id = $(this).data('postId');
    var form = $('#edit_post_title_' + post_id);
    var title = $('#post_title_' + post_id);

    if ($(this).hasClass('cancel')) {

      $(this).html('<i class="fa fa-pencil"></i>');
      $(this).removeClass('cancel');

    } else {

      $(this).html('<i class="fa fa-pencil">Отменить</i>');
      $(this).addClass('cancel');
    }
    form.toggle();
    title.togle();
	});

  $('a.edit_post_body_link').click(function() {

    var post_id = $(this).data('postId');
    var form = $('#edit_post_body_' + post_id);
    var body = $('#post_body_' + post_id);

    if ($(this).hasClass('cancel')) {

      $(this).html('<i class="fa fa-pencil">Редактировать</i>');
      $(this).removeClass('cancel');

    } else {

      $(this).html('<i class="fa fa-pencil">Отменить</i>');
      $(this).addClass('cancel');
    }
    form.toggle();
    body.togle();
  });
});