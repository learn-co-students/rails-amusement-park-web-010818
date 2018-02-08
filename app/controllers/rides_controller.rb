class RidesController < ApplicationController
  def create
    attraction_id = params[:attraction_id]
    user_id = session[:user_id]
    @ride = Ride.create(attraction_id: attraction_id, user_id: user_id)
    flash[:message] = @ride.take_ride
    redirect_to user_path(user_id)
  end
end
