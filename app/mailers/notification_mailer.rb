class NotificationMailer < ActionMailer::Base
  def idea_was_favorited
    @notification = params[:notification]
    mail(to: @notification.user.email, from: "info@aiit-idea-farm.net", subject: "あなたのアイデアがみせて！されました。【#{@notification.favorite.idea.title}】")
  end

  def your_idea_was_commented
    @notification = params[:notification]
    mail(to: @notification.user.email, from: "info@aiit-idea-farm.net", subject: "あなたのアイデアがコメントされました。【#{@notification.comment.idea.title}】")
  end

  def idea_you_favorited_was_commented
    @notification = params[:notification]
    mail(to: @notification.user.email, from: "info@aiit-idea-farm.net", subject: "あなたのみせて！したアイデアがコメントされました。【#{@notification.comment.idea.title}】")
  end
end