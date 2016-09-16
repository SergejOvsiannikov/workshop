class DeliveriesController < ApplicationController
  respond_to :html

  def new
    @delivery = CouponsDelivery.new
  end

  def create
    @delivery = CouponsDelivery.new(delivery_params)
    @delivery.compose

    respond_with @delivery, location: ''
  end

  private

  def delivery_params
    params.require(:coupons_delivery).permit(:emails)
  end
end
