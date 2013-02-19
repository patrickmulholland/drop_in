class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.text :short_description, :limit => nil
      t.date :date
      t.time :time
      t.string :venue
      t.string :city
      t.string :street
      t.text :details, :limit => nil

      t.timestamps
    end
  end
end
