class JobImage < ActiveRecord::Base
  mount_uploader :url, JobImageUploader
  
  belongs_to :job
end
