class Deletecityfromevents < ActiveRecord::Migration
  def change
    remove_column :events, :city
  end
end
