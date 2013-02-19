class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.create :short_description, :text, :limit => nil
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
