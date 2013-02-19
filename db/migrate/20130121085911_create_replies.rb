class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :event_id
      t.integer :user_id
      t.text :message
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
