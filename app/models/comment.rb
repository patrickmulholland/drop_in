class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :event_id
  
  belongs_to :user
  belongs_to :event
  
  validates :content, :length => {:maximum => 500}, :presence => true
  

end
