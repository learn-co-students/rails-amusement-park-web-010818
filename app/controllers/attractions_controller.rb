class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
    @user = User.find_by(id: session[:user_id])
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :min_height, :nausea_rating, :happiness_rating, :ticket_number)
  end
end
