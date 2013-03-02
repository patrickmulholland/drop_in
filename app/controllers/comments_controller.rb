class CommentsController < ApplicationController
  
  
  
  def new
    @comment = Comment.new
    @event = Event.find(params[:id])
    
    @comment.user_id = current_user.id
    @comment.event_id = @event.id     
  end
    
    
    def create
      
      @comment = Comment.new(params[:comment])
      @event = Event.find(@comment.event_id)  
      
      if @comment.save
        
        if @comment.user.profile.blank? == true
          unless @comment.event.user.id == current_user.id
            NotificationMailer.comment_notification(@comment).deliver
          end
        else
          if @comment.user.profile.receive_mails == true && @comment.event.user.id != current_user.id
            NotificationMailer.comment_notification(@comment).deliver
          end
        end
            
 
        redirect_to @event, notice: t(:comment_created)
      else
         render action: "new"
      end
    

    
  end
  
end