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
        
        if @comment.user.profile.receive_mails == true && @comment.event.user.id != current_user.id
          NotificationMailer.comment_notification(@comment).deliver
        end
        
        redirect_to @event, notice: 'Comment was successfully created.'
      else
         redirect_to @event, notice: 'Something went wrong'
      end
    

    
  end
  
end