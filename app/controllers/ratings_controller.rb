class RatingsController < ApplicationController
    

  def new
    @user = User.find(params[:id])    
    @rating = Rating.new  
    @rating.user_id = @user.id  
    @rating.event_id = params[:event_id] 
    @rating.result = params[:result]   
                                      
    @event = Event.find(params[:event_id]) #event finden zu dem man zurückleitet
     if @rating.save
       redirect_to rate_users_path(:id => @event), notice: 'Rating was successfully created.'
      else
        redirect_to rate_users_path(:id => @event), notice: 'Something went wrong'
        
       
     end
                     
  end    
  
  def edit
    @rating = Rating.find_by_user_id(params[:id])
    
  end    
  
  
  def update
    @rating = Rating.find(params[:id])
    @event_id = @rating.event_id

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to rate_users_path(:id => @event_id), notice: 'Comment created' }
      else
        format.html { redirect_to rate_users_path(:id => @event_id), notice: 'You cant leave the Comment blank!' }
      end
    end
  end
   
         
end         