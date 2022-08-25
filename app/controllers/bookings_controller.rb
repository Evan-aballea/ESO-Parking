class BookingsController < ApplicationController

  before_action :set_parking, only: %i[create]
  before_action :authenticate_user!


  def index
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.parking = @parking
    @booking.save!
    redirect_to parking_path(@parking)
  end

  def destroy
    @booking = Booking.find(booking_params)
    @booking.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def booking_params
    params.require(:booking).permit(:arrival, :depart)
  end
end
