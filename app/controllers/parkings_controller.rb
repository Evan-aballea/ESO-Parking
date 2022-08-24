class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @parkings = Parking.all
  end

  def show
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    if @parking.save
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
    params.require(:parking).permit(:address, photos: [])
  end

end
