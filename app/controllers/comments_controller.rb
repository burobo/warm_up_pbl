class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find(comments_params[:idea_id])
    comment = current_user.comments.new(comments_params)
    if idea.user == current_user || current_user == idea.users.find_by(id: current_user.id)
      if comment.save
        comment.create_notification_comment
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
