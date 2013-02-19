class AddMoreDetailsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :hobbies, :string
    add_column :profiles, :profession, :string
  end
end

