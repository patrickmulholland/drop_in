class AddLookedAtCommitToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :looked_at_commit, :boolean, :default => false
  end
end
