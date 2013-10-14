class ForSaleItem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  mount_uploader :cover, JobCoverUploader
  
  translates :description, :name
  accepts_nested_attributes_for :translations
  
  belongs_to :designers
end
