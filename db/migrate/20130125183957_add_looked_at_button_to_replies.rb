class AddLookedAtButtonToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :looked_at, :boolean
  end
end
