class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :comments, dependent: :destroy

  
end
