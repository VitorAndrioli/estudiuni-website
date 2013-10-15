class JobImage < ActiveRecord::Base
  mount_uploader :url, JobImageUploader
  
  attr_accessible :url, :job_id
  
  belongs_to :job
end
