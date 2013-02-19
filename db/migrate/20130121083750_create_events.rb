class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.text :short_description
      t.date :date
      t.time :time
      t.string :venue
      t.string :city
      t.string :street
      t.text :details

      t.timestamps
    end
  end
end
