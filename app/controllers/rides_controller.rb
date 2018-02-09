class RidesController < ApplicationController
  def create
    msg = ""
    @user = User.find(session[:user_id])
    @attraction = Attraction.find_by(id: params[:attraction_id].to_i)
    if @user.height < @attraction.min_height
      msg += "You are not tall enough to ride the #{@attraction.name}"
    end

    if @user.tickets < @attraction.tickets
      if msg.empty?
        msg += "You do not have enough tickets to ride the #{@attraction.name}"
      else
        msg += " You do not have enough tickets to ride the #{@attraction.name}"
      end
    end

    if msg.empty?
      @ride = Ride.create(attraction_id: params[:attraction_id].to_i, user_id: session[:user_id])
      @ride.take_ride
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
      redirect_to @user
    else
      flash[:notice] = msg
      redirect_to @user
    end
  end
end
