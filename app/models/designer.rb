class Designer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  mount_uploader :image, ProfilePictureUploader
  mount_uploader :curriculum, CurriculumUploader
  
  default_scope :order => "name ASC"
  
  translates :about
  accepts_nested_attributes_for :translations
  
  attr_accessible :name, :surname, :about, :facebook, :blogger, :behance, :pinterest, :vimeo, :linkedin, 
                  :email, :image, :curriculum, :translations_attributes
  
  has_and_belongs_to_many :jobs
  has_many :for_sale_items
end
