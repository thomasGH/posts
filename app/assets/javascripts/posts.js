$(document).ready(function() {
	$('a.edit_post_link').click(function() {
		
    var post_id = $(this).data('postId');
    var form = $('#edit_post_' + post_id);
    var title = $('h1');
    var body = $('p.body');

    if ($(this).hasClass('cancel')) {

      $(this).html('<i class="fa fa-pencil">Редактировать</i>');
      $(this).removeClass('cancel');

    } else {

      $(this).html('<i class="fa fa-pencil">Отменить</i>');
      $(this).addClass('cancel');
    }
    form.toggle();
    title.toggle();
    body.toggle();
	});
});