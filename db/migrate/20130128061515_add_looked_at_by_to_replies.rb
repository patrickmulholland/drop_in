class AddLookedAtByToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :looked_at_reply, :boolean, :default => false
    add_column :replies, :looked_at_invitation, :boolean, :default => false
  end
end
