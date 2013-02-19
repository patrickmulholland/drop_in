class Reply < ActiveRecord::Base
  attr_accessible :approved, :event_id, :message, :user_id, :looked_at_reply, :looked_at_invitation
  belongs_to :user
  belongs_to :event
  
  
  validates :message, :presence => true, :length => { :maximum => 500 }
  
  
end
