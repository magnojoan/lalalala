class Friend < ActiveRecord::Base
  attr_accessible :approved, :follower_id, :primary_user_id

  validates :follower_id, :presence => true
  validates :primary_user_id, :presence => true

 belongs_to :primary_user, :class_name => 'User', :foreign_key => "primary_user_id"
belongs_to :follower, :class_name => 'User', :foreign_key => "follower_id"

end