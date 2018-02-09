class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :min_height
      t.integer :nausea_rating
      t.integer :happiness_rating
      t.integer :ticket_number
    end
  end
end
