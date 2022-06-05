class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = Notification
      .eager_load(favorite: :user)
      .where(user_id: current_user.id)
      .order(created_at: :desc)
  end
end
