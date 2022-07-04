class NotificationMailer < ActionMailer::Base
  def idea_was_favorited
    @notification = params[:notification]
    mail(to: @notification.user.email, from: "info@aiit-idea-farm.net", subject: "あなたのアイデアがイイねされました！【#{@notification.favorite.idea.title}】")
  end
end