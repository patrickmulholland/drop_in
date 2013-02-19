class Changeeventtables < ActiveRecord::Migration
  def change
        
      remove_column :events, :venue
    
      change_column :events, :short_description, :text
      change_column :events, :city, :string, :default => "Muenchen"
      add_column :events, :meeting_point, :string
   
   
    end

end
