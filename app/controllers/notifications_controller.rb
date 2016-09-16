class NotificationsController < ApplicationController
  respond_to :html

  def new
    @notification = DeliveryForm.new
  end

  def create
    @notification = DeliveryForm.new(notification_params)
    @notification.save

    respond_with @notification
  end
end
