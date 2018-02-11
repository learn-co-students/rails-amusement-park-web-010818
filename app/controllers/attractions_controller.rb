class AttractionsController < ApplicationController
  before_action :require_log_in
  before_action :require_admin, only: [:new, :edit, :destroy]

  def index
    if params[:search]
      @attractions = Attraction.search(params[:search])
    else
      @attractions = Attraction.all
    end

  end

  def new
    @attraction = Attraction.new
  end

  def show
    @attraction = Attraction.find(params[:id])
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

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    redirect_to attractions_path
  end


  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end
end
