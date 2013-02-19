class Citybacktoevents < ActiveRecord::Migration
  def change
    
    add_column :events, :city, :string, :default => "Muenchen"
    
  end
end
