class Admin::JobImagesController < Admin::AdminController
  
  before_filter :authenticate
  
  def index
    JobImage.consolidate_positions( params[:job_id] || params[:job] )
    @job = Job.find( params[:job_id] )
    @job_images = @job.job_images
  end
  
  def new
    @job = Job.find( params[:job_id] )
    @job_image = JobImage.new
    @job_image.job = @job
    
    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
  def create
    @job_image = JobImage.new( params[:job_image] )
    @job_image.save
    
    respond_to do |format|
      if @job_image.save
        format.html { redirect_to(:action => "index", :job_id => @job_image.job.id) }
      else
        format.html { redirect_to(:action => "new") }
      end
    end
  end
  
  def destroy
    job_image = JobImage.find( params[:id] )
    job = job_image.job
    job_image.delete
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :job_id => job.id) }
    end
  end
  
  def up
    image = JobImage.find(params[:id])
    if image.position > 0
      previous_images = JobImage.where("position = ? and job_id = ?", image.position - 1, image.job.id).limit(1)
      if previous_images and previous_images.length > 0
        previous_image = previous_images[0]
        previous_image.position = image.position
        image.position = image.position - 1        
        previous_image.save
        image.save
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :job_id => image.job.id) }
    end
  end
  
  def down
    image = JobImage.find(params[:id])
    next_images = JobImage.where("position = ? and job_id = ?", image.position + 1, image.job.id).limit(1)
    if next_images and next_images.length > 0
      next_image = next_images[0]
      next_image.position = image.position
      image.position = image.position + 1       
      next_image.save
      image.save
    end
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :job_id => image.job.id) }
    end
  end
end
