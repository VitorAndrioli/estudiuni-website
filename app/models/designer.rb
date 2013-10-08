class Designer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :picture, ProfilePictureUploader
  
  default_scope :order => "name ASC"
  
  translates :about
  accepts_nested_attributes_for :translations
  
  has_and_belongs_to_many :jobs
end
