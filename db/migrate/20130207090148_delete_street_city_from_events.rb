class DeleteStreetCityFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :street_city
  end
end
