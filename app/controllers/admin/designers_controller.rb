class Admin::DesignersController < Admin::AdminController
  before_filter :authenticate
  
  def index
    @designers = Designer.all
  end
  
  def new
    @designer = Designer.new
    
    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
  def create
    @designer = Designer.create( params[:designer] )
    
    respond_to do |format|
      if @designer.save
        format.html { redirect_to(:action => "index") }
      else 
        format.html { redirect_to(:action => "new") }
      end
    end
  end
  
  def destroy
    designer = Designer.find( params[:id] )
    designer.delete
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
  
  def edit
    @designer = Designer.find( params[:id] )
  end
  
  def update
    @designer = Designer.find( params[:id] )
    @designer.update_attributes( params[:designer] )
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
end
