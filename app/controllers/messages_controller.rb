class MessagesController < ApplicationController
  
  
  
  def new
    @message = Message.new
  end
    
    
    def create
      
      @message = Message.new(params[:message])  
      
      if @message.save
        NotificationMailer.contact_form(@message).deliver
        redirect_to root_path, notice: t(:message_sent)
      else
         render action: "new"
      end
    end
  
end