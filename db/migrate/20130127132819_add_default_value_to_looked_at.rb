class AddDefaultValueToLookedAt < ActiveRecord::Migration
  def change
    change_column :replies, :looked_at, :boolean, :default => false
  end
end
