class Attraction < ActiveRecord::Base
  has_many :rides
  has_many :users, through: :rides

  def self.search(search_term)
    self.all.select do |attraction|
      attraction.name.downcase.include?(search_term.downcase)
    end
  end

end
