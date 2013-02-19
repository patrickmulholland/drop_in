class UsersController < ApplicationController
    
    before_filter :authenticate_user!

  def show
    
    @user = User.find(params[:id])
                
    #new rating counter zurücksetzen falls da
    
    if @user == current_user
      @ratings_unseen = Rating.where(:user_id => current_user, :looked_at => false)
    
      @ratings_unseen.each do |rating|
        if rating.looked_at == false
          rating.looked_at = true
          rating.save
        end
      end
    
    end
  
  end 

end
