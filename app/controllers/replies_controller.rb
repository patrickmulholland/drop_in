class RepliesController < ApplicationController
  # GET /replies
  # GET /replies.json
  def index
    @all_replies = Reply.where(:user_id => current_user)
    @future_replies = Reply.where(:user_id => current_user).joins(:event).where("date >= ?", Date.today)
    
    @replies_waiting = @future_replies.where(:approved => false)
    
    @replies_invited = @future_replies.where(:approved => true, :commit => false)
    
    @replies_commited = @future_replies.where(:commit => true)
    
        

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.json
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.json
  def new
    
    @event = Event.find(params[:id])
    
    @reply = Reply.new
    @reply.user_id = current_user.id
    @reply.event_id = @event.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

#-------------------- authorize button

  def authorize_to_see
    @reply = Reply.find(params[:id])
    @reply.approved = true
    if @reply.save
      
      
      if @reply.user.profile.blank? == true
        NotificationMailer.invitation_notification(@reply).deliver
        
      
      elsif @reply.user.profile.receive_mails == true
        NotificationMailer.invitation_notification(@reply).deliver
        
      end
      
      
      
      
      
      
      redirect_to events_path, notice: t(:allowed_all)
    else
      redirect_to events_path, notice: t(:error)
    end
  end

# ------------------- end authorize button

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(params[:reply])

    respond_to do |format|
      if @reply.save
        
        if @reply.event.user.profile.blank? == true
          NotificationMailer.reply_notification(@reply).deliver
        
        elsif @reply.event.user.profile.receive_mails == true
          NotificationMailer.reply_notification(@reply).deliver
          
        end
        
        format.html { redirect_to replies_path, notice: t(:reply_created) }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.json
  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        format.html { redirect_to @reply, notice: t(:reply_update) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to replies_url }
      format.json { head :no_content }
    end
  end
end
