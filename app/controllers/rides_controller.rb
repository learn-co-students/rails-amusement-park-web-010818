class RidesController < ApplicationController
  def create
    @ride = Ride.new(ride_params)
    ride_result = @ride.take_ride
    if !ride_result.is_a?(String)
      @ride.save
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to current_user
    else
      flash[:notice] = ride_result
      redirect_to current_user
    end

  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
