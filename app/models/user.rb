class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  validates :name,:happiness, :height, :nausea, :tickets,  presence: true
  # validates :happiness, :nausea, numericality: {greater_than: 0, less_than: 6}
  # vaildates :tickets, numericality: {only_integer: true}


  has_secure_password



  def mood
    if (happiness > nausea)
      "happy"
    else
      "sad"
    end
  end




end
