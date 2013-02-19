class ChangeLookedAtToTwoTablesCreatorUser < ActiveRecord::Migration
  def change
    
    remove_column :replies, :looked_at
    



  end

end
