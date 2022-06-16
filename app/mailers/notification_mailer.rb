class NotificationMailer < ActionMailer::Base
  def idea_was_favorited
    @notification = params[:notification]
    mail(to: @notification.user.email, from: "info@aiit-idea-farm.net", subject: "アイデア【#{@notification.favorite.idea.title}】がイイねされました。")
  end
end