require 'pp'

class IdeasController < ApplicationController
  before_action :set_idea, only: %i[ show edit update destroy favorite ]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /ideas or /ideas.json
  # def index
  #   @ideas = Idea.all
  # end

  # GET /ideas/1 or /ideas/1.json
  def show
    logger.debug @idea.id
    @comment = Comment.new
  end

  # GET /ideas/register
  def register
    @idea = Idea.new
  end

  def favorite
    if @idea.user_id == current_user.id
      return redirect_to ({controller: :ideas, action: :show, id: @idea.id})
    end
    favorite = Favorite.where(user_id: current_user.id, idea_id: @idea.id).first
    message = ''
    if favorite == nil
      favorite = @idea.favorites.build()
      favorite.user_id = current_user.id
      favorite.idea_id = @idea.id
      favorite.save
      favorite.create_notification_favorite(favorite)
      NotificationMailer.with(notification: favorite.notification).idea_was_favorited.deliver_now
      message = 'イイねしました。'
    else
      favorite.destroy
      message = 'イイねを解除しました。'
    end
      return redirect_to ({controller: :ideas, action: :show, id: @idea.id}), notice: message
  end

  # GET /ideas/1/edit
  def edit
    if @idea.user_id != current_user.id
      redirect_to ({controller: :ideas, action: :show, id: @idea.id})
    end
  end

  # POST /ideas/register
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    @idea.images.attach(params[:idea][:images])
    respond_to do |format|
      if @idea.save
        format.html { redirect_to ({controller: :ideas, action: :show, id: @idea.id}), notice: "アイデアを作成しました。" }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :register, status: :unprocessable_entity }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1 or /ideas/1.json
  def update
    if @idea.user_id != current_user.id
      return redirect_to ({controller: :ideas, action: :show, id: @idea.id})
    end
    if @idea.update(idea_params)
      return redirect_to ({controller: :ideas, action: :show, id: @idea.id}), notice: "Idea was successfully updated."
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ideas/1 or /ideas/1.json
  # def destroy
  #   @idea.destroy

  #   respond_to do |format|
  #     format.html { redirect_to ideas_url, notice: "Idea was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:title, :outline, :detail, :user_id)
    end
end
