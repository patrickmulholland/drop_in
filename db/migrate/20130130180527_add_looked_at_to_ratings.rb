class AddLookedAtToRatings < ActiveRecord::Migration
  def change      
    add_column :ratings, :looked_at, :boolean, :default => false
  end
end
