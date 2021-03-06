class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification, only: :update

  def index
    @notifications = Notification
      .eager_load(favorite: :user)
      .where(user_id: current_user.id, checked: false)
      .order(created_at: :desc)
  end

  def update
    @notification.update!(checked: true)
    return redirect_to :notifications, notice: "通知を既読にしました。"
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
