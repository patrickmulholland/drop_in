class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.string :result
      t.string :comment

      t.timestamps
    end
  end
end
