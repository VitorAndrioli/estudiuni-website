class JobImage < ActiveRecord::Base
  mount_uploader :url, JobImageUploader
  
  default_scope :order => "position ASC"
  
  attr_accessible :url, :job_id
  
  belongs_to :job
  
  def self.consolidate_positions(job_id)
    images = JobImage.where("job_id = ?", job_id)
    position = 0
    images.each do |image|
      image.position = position
      image.save
      position = position + 1
    end    
  
  end
end
