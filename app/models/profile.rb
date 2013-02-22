class Profile < ActiveRecord::Base
  attr_accessible :about_you, :birthday, :gender, :hometown, :image, :user_id, :hobbies, :profession, :avatar, :receive_mails
  belongs_to :user
  has_attached_file :avatar, :styles => { :big => "150x150#", :medium => "80x80#", :thumb => "40x40#" }
  
  
  #Validations:
  
  
  
end
