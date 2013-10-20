class ForSaleItemImage < ActiveRecord::Base
  mount_uploader :url, JobImageUploader
  
  default_scope :order => "position ASC"
  
  attr_accessible :url, :for_sale_item_id
  
  belongs_to :for_sale_item
  
  def self.consolidate_positions(for_sale_item_id)
    images = ForSaleItemImage.where("for_sale_item_id = ?", for_sale_item_id)
    position = 0
    images.each do |image|
      image.position = position
      image.save
      position = position + 1
    end    
  end
end
