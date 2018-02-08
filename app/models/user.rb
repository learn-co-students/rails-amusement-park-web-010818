class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  # validates :name, presence: true
  # validates :name, uniqueness: true

  def mood
    if self.nausea.to_i > self.happiness.to_i
      "sad"
    else
      "happy"
    end
  end
end
