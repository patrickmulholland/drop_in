class RatingsController < ApplicationController
    

  def new
    @user = User.find(params[:id])    
    @rating = Rating.new  
    @rating.user_id = @user.id  
    @rating.event_id = params[:event_id] 
    @rating.result = params[:result]
     
                                      
    @event = Event.find(params[:event_id]) #event finden zu dem man zurückleitet
     if @rating.save
       redirect_to rate_users_path(:id => @event), notice: t(:rating_created)
      else
        redirect_to rate_users_path(:id => @event), notice: t(:rating_wrong)
        
       
     end
                     
  end    
  
  def edit
    @rating = Rating.find_by_user_id(params[:id])
    
  end    
  
  
  def update
    @rating = Rating.find(params[:id])
    @event_id = @rating.event_id


      if @rating.update_attributes(params[:rating])
        if @rating.comment.blank?
          @rating.comment = nil
          @rating.save
          redirect_to rate_users_path(:id => @event_id), notice: t(:rating_comment_blank)
        else
          redirect_to rate_users_path(:id => @event_id), notice: t(:rating_comment_created)
        end
      else
        redirect_to edit_ratings_path(:id => @event_id), notice: t(:rating_bug)
      end
    
  end
   
         
end         