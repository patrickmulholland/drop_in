module ApplicationHelper
  
  def upcoming_events_for_current_user
    Reply.where(:user_id => current_user, :commit => true).joins(:event).where("date = ?", Date.today)
  end

  def count_past_commits_user
    Reply.where(:user_id => @user, :commit => true).joins(:event).where("date < ?", Date.today).count
  end
  
end
