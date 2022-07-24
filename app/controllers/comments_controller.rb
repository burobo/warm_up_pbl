class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(comments_params[:idea_id])
    comment = current_user.comments.new(comments_params)
    if idea.user == current_user || current_user == idea.users.find_by(id: current_user.id)
      if comment.save
        notification_for_originator = comment.create_comment_notification_for_originator
        notifications_for_other_users_favorite = comment.create_comment_notifications_for_implementor
        NotificationMailer.with(notification: notification_for_originator).your_idea_was_commented.deliver_now
        notifications_for_other_users_favorite.each do |notification_for_other_users_favorite|
          NotificationMailer.with(notification: notification_for_other_users_favorite).idea_you_favorited_was_commented.deliver_now
        end
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
end
