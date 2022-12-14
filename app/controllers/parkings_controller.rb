class ParkingsController < ApplicationController

  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show, :create]

  def index
    if params[:query].present?
      @parkings = Parking.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @parkings = Parking.all
    end
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
    # The `geocoded` scope filters only flats with coordinates
    @parking_map = Parking.where(id: params[:id])
    @markers = @parking_map.geocoded.map do |park|
      {
        lat: park.latitude,
        lng: park.longitude
      }
    end
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
    @parking = Parking.find(params[:id])
  end

  def update
    @parking = Parking.find(params[:id])
    @parking.update(parking_params)
    # No need for app/views/restaurants/update.html.erb
    redirect_to parking_path(@parking)
  end

  def destroy
    @parking.destroy
    redirect_to parkings_path, status: :see_other
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parking_params
    params.require(:parking).permit(:address, :height, :width, :length, :description, :pass_code, :start_date, :end_date, :price, photos: [])
  end
end
