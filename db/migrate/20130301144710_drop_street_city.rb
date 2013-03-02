class DropStreetCity < ActiveRecord::Migration
  def change
    remove_column :events, :street_city 
  end
end
