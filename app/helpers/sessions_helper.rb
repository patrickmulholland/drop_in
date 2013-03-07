module SessionsHelper
  

#  def sign_in(user)
#    cookies.permanent[:remember_token] = user.remember_token
#    self.current_user = user
#  end
#  
#  def user_signed_in?

#    !current_user.nil?
#  end
#  
#  def signed_in_user
#    unless user_signed_in?

#      store_location
#      redirect_to signin_path, notice: "Please sign in!"
#    end
#  end
#
#  def current_user=(user)
#    @current_user = user
#  end
#  
#  def current_user
#    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
#  end
#  
  def current_user?(user)
    user == current_user
  end
#  
#  def sign_out
#    self.current_user = nil
#    cookies.delete(:remember_token)
#  end

  
#  def redirect_back_or(default)
#    redirect_to(session[:return_to] || default)
#    session.delete(:return_to)
#  end
  
#  def store_location
#    session[:return_to] = request.fullpath
#  end
  
  
#--------------------- eigenes gewurschtel ------------

  def user_is_not_current_user?(user)
    user.user_id.to_i != current_user.id.to_i
  end
  
# -- nachfolgende 2 kombinieren mit if oder so:  
  
  def count_new_replies_for_events(events)
      @id_array = []
      events.each do |i|
        @id_array << i.id
      end
      return Reply.where(:event_id => @id_array, :looked_at_reply => false).count
  end

  def count_new_replies_for_event(event)
      return Reply.where("event_id = ? AND looked_at_reply = ?", event, false).count
  end

  def count_new_invitations
    Reply.where(:user_id => current_user, :approved => true, :looked_at_invitation => false).count
  end
  
  def count_new_comments_for_events(events)
      @id_array = []
      events.each do |i|
        @id_array << i.id
      end
      return Comment.where(:event_id => @id_array, :looked_at => false).count
  end
  
  def count_new_comments_for_event(event)
      return Comment.where("event_id = ? AND looked_at = ?", event, false).count
  end
  
  def find_current_reply(event)
    Reply.where(:user_id => current_user, :event_id => event).first
  end
  
  def count_new_commits_for_events(events)
      @id_array = []
      events.each do |i|
        @id_array << i.id
      end
      return Reply.where(:event_id => @id_array, :commit => true, :looked_at_commit => false).count
  end
  
  def count_new_commits_for_event(event)
      return Reply.where(:event_id => event, :commit => true, :looked_at_commit => false).count
  end
  
  def count_commits(event)
    Reply.where(:event_id => event, :commit => true).count
  end             
  
  def count_new_ratings
    Rating.where(:user_id => current_user, :looked_at => false).count
  end
  
  
  def find_event_by_rating_event_id(rating_event_id)
    Event.where(:id => rating_event_id).first
  end
  
  def count_users_events
    Event.where("user_id = ? AND date >= ?", current_user, Date.today).count
  end
  
  def count_users_replies
    Reply.where(:user_id => current_user).joins(:event).where("date >= ?", Date.today).count
  end
  
  
end



















