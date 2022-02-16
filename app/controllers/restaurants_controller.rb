class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restraurant_params)
    raise
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    end
      render :new
  end

  private

  def restraurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
