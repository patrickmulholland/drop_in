class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :image
      t.string :hometown
      t.text :about_you
      t.date :birthday
      t.string :gender

      t.timestamps
    end
  end
end
