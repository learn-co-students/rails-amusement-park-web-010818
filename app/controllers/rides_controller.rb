class RidesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @ride = Ride.create(attraction_id: params[:attraction_id].to_i, user_id: session[:user_id])
    @ride.take_ride
    flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    redirect_to @user
  end
end
