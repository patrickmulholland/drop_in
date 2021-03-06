class Profile < ActiveRecord::Base
  attr_accessible :about_you, :birthday, :gender, :hometown, :image, :user_id, :hobbies, :profession, :avatar, :receive_mails
  belongs_to :user
  has_attached_file :avatar,
  :styles => { :big => "150x150#", :medium => "100x100#", :thumb => "70x70#" }
  
  #Wenn wieder auf Dropbox umstellen, dann un-kommentieren und oben ein komma rein machen!!!:
  
  #:storage => :dropbox,
  #:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
  #  :dropbox_options => {
  #      :path => proc { |style| "#{style}/#{Rails.env}_#{id}_#{avatar.original_filename}" }
  #    }
  
  
  #Validations:
  
  
  validates :hometown, :length => {:maximum => 30}
  validates :profession, :length => {:maximum => 30}
  validates :hobbies, :length => {:maximum => 80}
  validates :about_you, :length => {:maximum => 1000}
  
  
end
