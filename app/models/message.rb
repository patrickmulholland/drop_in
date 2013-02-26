class Message < ActiveRecord::Base
  attr_accessible :content, :email, :name, :topic
  
  validates :name, :presence => true

  validates :content, :presence => true, :length => { :maximum => 500 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, format: { with: VALID_EMAIL_REGEX }
  
end
