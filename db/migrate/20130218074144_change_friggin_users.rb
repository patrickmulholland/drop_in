class ChangeFrigginUsers < ActiveRecord::Migration
  
  

    def change
    
    
      remove_column :users, :email
      remove_column :users, :password_digest      
      remove_column :users, :remember_token
      remove_column :users, :admin

    end
  
  
  
end
