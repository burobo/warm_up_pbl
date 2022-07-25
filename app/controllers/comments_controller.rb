class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(comments_params[:idea_id])
    comment = current_user.comments.new(comments_params)
    if idea.user == current_user || current_user == idea.users.find_by(id: current_user.id)
      if comment.save
        notify_to_originator(comment)
        notify_to_other_users_favorite(comment)
        redirect_to request.referer, notice: "コメントを投稿しました。"
      else
        redirect_to request.referer, notice: "コメントの投稿に失敗しました。"
      end
    end
  end
  
  private
  def comments_params
    params.require(:comment).permit(:content, :idea_id)
  end

  def notify_to_originator(comment)
    if comment.idea.user.id != current_user.id
      notification_for_originator = comment.create_comment_notification_for_originator
      NotificationMailer.with(notification: notification_for_originator).your_idea_was_commented.deliver_now
    end
  end

  def notify_to_other_users_favorite(comment)
    notifications_for_other_users_favorite = comment.create_comment_notifications_for_implementor
    notifications_for_other_users_favorite.each do |notification_for_other_users_favorite|
      NotificationMailer.with(notification: notification_for_other_users_favorite).idea_you_favorited_was_commented.deliver_now
    end
  end
end
