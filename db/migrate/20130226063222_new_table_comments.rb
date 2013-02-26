class NewTableComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :event_id
      t.integer :user_id
      t.string :content
    end
  end
end
