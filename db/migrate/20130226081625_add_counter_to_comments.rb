class AddCounterToComments < ActiveRecord::Migration
  def change
    add_column :comments, :looked_at, :boolean, :default => false
  end
end
