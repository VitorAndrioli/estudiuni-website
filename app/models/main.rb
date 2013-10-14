class Main < ActiveRecord::Base
  mount_uploader :picture, ProfilePictureUploader
  
  translates :about
  accepts_nested_attributes_for :translations
  
  attr_accessible :about, :email, :picture, :translations_attributes
  
  has_many :jobs
end
