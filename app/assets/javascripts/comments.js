$(document).ready(function() {
  $('a.edit_comment_link').click(function() {

    var form = $('form.edit_comment');
    var body = $('div.comment_body');

    if ($(this).hasClass('cancel')) {

      $(this).html('<i class="fa fa-pencil">Редактировать</i>');
      $(this).removeClass('cancel');

    } else {

      $(this).html('<i class="fa fa-pencil">Отменить</i>');
      $(this).addClass('cancel');
    }
    form.toggle();
    body.toggle();
  });
});