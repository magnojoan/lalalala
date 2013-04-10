class Avatar < ActiveRecord::Base
  attr_accessible :file, :name, :user_id

attr_accessor :asset_file_name
attr_accessor :photo_content_type
attr_accessor :photo_file_size
attr_accessor :photo_updated_at

   belongs_to :user


  validates :name, :presence => true
  validates :user_id, :presence => true
    has_attached_file :file, :styles => { :small => "50x50#", :medium => "150x150#" }
validates_attachment :file, :presence => true,
    :content_type => { :content_type => ["image/jpg", "image/png", "image/jpeg"] }
end
