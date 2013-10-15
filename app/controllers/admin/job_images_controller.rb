class Admin::JobImagesController < Admin::AdminController
  
  before_filter :authenticate
  
  def index
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
end
