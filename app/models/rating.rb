class Rating < ActiveRecord::Base
  attr_accessible :comment, :result, :user_id
  belongs_to :user  
  has_one :event
  
  validates :comment, :length => {:maximum => 500}
  
  
end
