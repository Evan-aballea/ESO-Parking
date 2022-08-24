class PagesController < ApplicationController
  def home
  end

  def profile
    @parkings = Parking.where(user: current_user)
    @bookings = Booking.where(user: current_user)
  end

  private

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def booking_params
    params.require(:booking).permit(:arrival, :depart)
  end

  def parking_params
    params.require(:parking).permit(:address, photos: [])
  end
end
