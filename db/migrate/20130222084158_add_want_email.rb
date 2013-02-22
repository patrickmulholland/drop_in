class AddWantEmail < ActiveRecord::Migration
  def change
    add_column :profiles, :receive_mails, :boolean, :default => true
  end
end
