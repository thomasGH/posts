class NotificationMailer < ApplicationMailer
  def comment_notification(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: 'Новый комментарий к вашему посту')
  end

  def moderate_notification(post)
    @post = post

    if post.approved
      mail(to: post.user.email, subject: 'Ваш пост подтвержден')
    else
      mail(to: post.user.email, subject: 'Ваш пост отклонен')
    end
  end
end
