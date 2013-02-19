class AddCommitToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :commit, :boolean, :default => false
  end
end
