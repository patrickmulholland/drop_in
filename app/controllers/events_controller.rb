class EventsController < ApplicationController

  before_filter :authenticate_user!
  
  def index
    @events = Event.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
              
  def rate_users  
    @event = Event.find(params[:id]) 
    @commited_replies = @event.replies.where(:commit => true)
  end

  def show
    @event = Event.find(params[:id])

    #Wenn Autor auf Show Event geht wird zähler für Neue Replies zurückgesetzt.
    #Wenn Eingeladener sich den Event anschaut wird sein zähler zurückgesetzt.
    
    if @event.user == current_user
      @replies_unseen = Reply.where(:event_id => @event, :looked_at_reply => false)
      @replies_unseen.each do |reply|
        if reply.looked_at_reply == false
          reply.looked_at_reply = true
          reply.save
        end
      end
      
      @comments_unseen = Comment.where(:event_id => @event, :looked_at => false)
      @comments_unseen.each do |comment|
        if comment.looked_at == false
          comment.looked_at = true
          comment.save
        end
      end
      
      @commits_unseen = Reply.where(:event_id => @event, :commit => true, :looked_at_commit => false)
      @commits_unseen.each do |commit|
        if commit.looked_at_commit == false
          commit.looked_at_commit = true
          commit.save
        end
      end
    else
      @current_reply = Reply.where(:event_id => @event, :user_id => current_user)
      @save = @current_reply.first
      if @save.looked_at_invitation == false
        @save.looked_at_invitation = true
        @save.save
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    @event.user_id = current_user.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end
  
  def commit
    @event = Event.find(params[:id])
    @reply = Reply.where(:user_id => current_user, :event_id => @event).first
    @reply.commit = true
    if @reply.save
      
      if @reply.event.user.profile.blank? == true
        NotificationMailer.commit_notification(@reply).deliver
      
      elsif @reply.event.user.profile.receive_mails == true
        NotificationMailer.commit_notification(@reply).deliver
      end
      

      
      redirect_to replies_path, notice: t(:event_commited)
    else
      redirect_to replies_path, notice: t(:event_error)
    end
  end
  
  def refuse
    @event = Event.find(params[:id])
    @reply = Reply.where(:user_id => current_user, :event_id => @event).first
    @reply.commit = false
    if @reply.save
      redirect_to replies_path, notice: t(:event_uncommited)
    else
      redirect_to replies_path, notice: t(:event_error)
    end
  end
  
  
  def userevents
    @users_replies = Reply.where(:user_id => params[:user], :commit => true).joins(:event).where("date < ?", Date.today).last(10)
            
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    
    
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: t(:event_created) }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    
    
    @event = Event.find(params[:id])


    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: t(:event_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
      
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: t(:event_deleted) }
      format.json { head :no_content }
    end
  end
  
  
  
end
