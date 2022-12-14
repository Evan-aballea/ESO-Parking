class BookingsController < ApplicationController

  before_action :set_parking, only: %i[create]
  before_action :authenticate_user!


  def index
  end

  def validate
    @booking = Booking.find(params[:id])
    @booking.confirmation = true
    @booking.save!
    redirect_to profile_path()
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.parking = @parking
    @booking.save!
    redirect_to profile_path(@booking.user)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path, status: :see_other
  end


  private

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def booking_params
    params.require(:booking).permit(:booking_start, :booking_end)
  end
end
