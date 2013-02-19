class DeleteImageFromProfiles2 < ActiveRecord::Migration
  def change
    remove_column :profiles, :image
  end
end
  