$(document).ready(function() {
  $('a.edit_category_link').click(function() {

    var category_id = $(this).data('categoryId');
    var form = $('#edit_category_' + category_id);
    var title = $('#category_' + category_id);

    if ($(this).hasClass('cancel')) {

      $(this).html('<i class="fa fa-pencil">Редактировать</i>');
      $(this).removeClass('cancel');

    } else {

      $(this).html('<i class="fa fa-pencil">Отменить</i>');
      $(this).addClass('cancel');
    }
    form.toggle();
    title.togle();
  })
})
