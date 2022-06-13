class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = current_user.comments.new(comments_params)
    if comment.save
      redirect_to request.referer, notice: "コメントを投稿しました。"
    else
      redirect_to request.referer, notice: "コメントの投稿に失敗しました。"
    end
  end
  
  private
  def comments_params
    params.require(:comment).permit(:content, :idea_id)
  end
end
