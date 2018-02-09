class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    msg = ""
    if user.tickets < attraction.tickets
      msg += "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      if msg.empty?
        msg += "Sorry."
      end

      msg += " You are not tall enough to ride the #{attraction.name}."
    end

    if msg.empty?
      user.tickets -= attraction.tickets
      user.happiness += attraction.happiness_rating
      user.nausea += attraction.nausea_rating
      user.save
    else
      msg
    end
  end
end
