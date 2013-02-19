class Addanothergeocodetable < ActiveRecord::Migration
  def change
    
    
    add_column :events, :street_city, :string
    
    
  end
end
