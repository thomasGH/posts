class NotificationMailer < ApplicationMailer
  def comment_notification(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: 'Новый комментарий к вашему посту')
  end

  def comment_distribution(users, post, comment)
    users.each do |user|
      @user = user
      @post = post
      @comment = comment

      mail(to: user.email, subject: 'Новый комментарий к посту по подписке')
    end
  end

  def moderate_state_notification(post)
    @post = post

    mail(to: post.user.email, subject: 'Статус вашего поста изменен')
  end
end
