class Profile < ActiveRecord::Base
  attr_accessible :about_you, :birthday, :gender, :hometown, :image, :user_id, :hobbies, :profession, :avatar, :receive_mails
  belongs_to :user
  has_attached_file :avatar, :styles => { :big => "150x150#", :medium => "80x80#", :thumb => "40x40#" }
  
  
  #Validations:
  
  
  validates :hometown, :length => {:maximum => 30}
  validates :profession, :length => {:maximum => 30}
  validates :hobbies, :length => {:maximum => 80}
  validates :about_you, :length => {:maximum => 1000}
  
  
end
