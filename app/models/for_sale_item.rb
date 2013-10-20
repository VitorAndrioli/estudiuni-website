class ForSaleItem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  
  mount_uploader :cover, JobCoverUploader
  
  translates :description, :name
  accepts_nested_attributes_for :translations
  
  attr_accessible :name, :description, :cover, :designer_id, :translations_attributes
  
  belongs_to :designer
  has_many :for_sale_item_images
end
