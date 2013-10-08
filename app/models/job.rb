class Job < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  mount_uploader :cover, JobCoverUploader
  
  translates :description, :name
  accepts_nested_attributes_for :translations
  
  has_and_belongs_to_many :designers
  has_many :job_images
  belongs_to :main
end
