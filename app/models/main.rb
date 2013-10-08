class Main < ActiveRecord::Base
  mount_uploader :picture, ProfilePictureUploader
  
  translates :about
  accepts_nested_attributes_for :translations
  
  has_many :jobs
end
