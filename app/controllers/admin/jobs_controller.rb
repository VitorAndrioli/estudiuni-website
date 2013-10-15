class Admin::JobsController < Admin::AdminController
  
  before_filter :authenticate
  
  def index
    @jobs = Job.order("name ASC")
  end

  def new
    @job = Job.new
    
    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
  def create
    @job = Job.create( params[:job] )
    
    respond_to do |format|
      if @job.save
        format.html { redirect_to(:action => "index")}
      else
        format.html { redirect_to(:action => "new")}
      end
    end
  end

  def edit
    @job = Job.find( params[:id] )
  end

  def update
    @job = Job.find( params[:id] )
    @job.update_attributes( params[:job] )
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
  
  def destroy
    job = Job.find( params[:id] )
    job.delete
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
end
