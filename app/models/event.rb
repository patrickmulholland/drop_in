class Event < ActiveRecord::Base
  attr_accessible :city, :date, :details, :short_description, :street, :meeting_point, :time, :user_id, :latitude, :longitude
  belongs_to :user
  has_many :replies, dependent: :destroy   
  has_many :ratings, dependent: :destroy

  
  
  #---------------Validations:----------------
  
  validates :short_description, :length => {:maximum => 500}, :presence => true
  validates :date, :presence => true
  validates :time, :presence => true
  validates :street, :presence => true, :length => { :maximum => 50 }
  validates :details, :presence => true, :length => { :maximum => 500 }
  
  
  
  
  
  
  
  geocoded_by :full_address
  after_validation :geocode

 
  def full_address
    [street, city].compact.join(", ")
  end

end
