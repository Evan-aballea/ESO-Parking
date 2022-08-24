class ParkingsController < ApplicationController

  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    @parkings = Parking.all
    @markers = @parkings.geocoded.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude,
        info_window: render_to_string(partial: "info_window", locals: {parking: parking})
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user = current_user
    if @parking.save!
      redirect_to parking_path(@parking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end


  def parking_params
    params.require(:parking).permit(:address, :height, :width, :length, :description, :pass_code, :availability_date, :availability_time, :price, photos: [])
  end

end
