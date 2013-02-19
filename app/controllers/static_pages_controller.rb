class StaticPagesController < ApplicationController

 
 

  def all_events
    @events = Event.order("created_at DESC").paginate(page: params[:page], :per_page => 5)    
    @yourevents = current_user.events if user_signed_in?

    @your_replies = Reply.where(:user_id => current_user) 
  end
  
  def by_date

    @yourevents = current_user.events if user_signed_in?

    @your_replies = Reply.where(:user_id => current_user)
    
    @events = Event.where("date >= ?", Date.today).order("date ASC").page(params[:page]).per_page(5)
    
  end

  
end
