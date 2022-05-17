class PagesController < ApplicationController
  def index
    @ideas = Idea.all.order('updated_at DESC').page(params[:page]).per(10)
  end

  def detail
  end
end
