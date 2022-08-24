class BookingsController < ApplicationController

  before_action :set_parking, only: %i[create]
  before_action :authenticate_user!


  def index

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.parking = @parking
    @booking.save
    # redirect_to restaurant_path(@restaurant)
  end

  def destroy
  end

  private

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def booking_params
    params.require(:booking).permit(:arrival)
  end
end
