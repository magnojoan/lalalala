class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :file

def to_s
    full_name
  end

  def full_name
    "#{last_name}, #{first_name}"
  end

  validates :first_name, :presence => true
  validates :last_name, :presence => true

   has_attached_file :file, :styles => { :small => "50x50#", :medium => "150x150#" }
validates_attachment :file, :content_type => { :content_type => ["image/jpg", "image/png", "image/jpeg"] } 

  has_many :friends
  has_many :inverse_friendships, :class_name => "Friend", :foreign_key => "follower_id"
  has_many :direct_friends, :through => :friends, :conditions => "approved = true", :source => :follower
  has_many :inverse_friends, :through => :inverse_friendships, :conditions => "approved = true", :source => :primary_user
  has_many :pending_friends, :through => :friends, :conditions => "approved = false", :foreign_key => "primary_user_id", :source => :primary_user
has_many :requested_friendships, :through => :inverse_friendships, :foreign_key => “follower_id”, :conditions => "approved = false", :source => :primary_user

  def friends
    direct_friends | inverse_friends
  end

  has_many :tweets
end
