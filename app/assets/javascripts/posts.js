$(document).ready(function() {
	$('form.new_post').submit(function() {
		alert('Отправка формы');
		var post_title = $(this).find('#post_title');
		var title = post_title.val();
		if (post_title == '' || post_title == undefined) {
			post_title.addClass('field_with_errors')
			alert('Введите название поста');
			return false;
		}
	})
})