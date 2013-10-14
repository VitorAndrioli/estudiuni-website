class Admin::MainController < Admin::AdminController
  before_filter :authenticate
  
  def index
    if Main.count == 0
      @main = Main.new
      @main.save
    else
      @main = Main.all[0]
    end
    
    respond_to do |format|
      format.html #index.html.erb
    end
  end
  
  def update
    @main = Main.find( params[:id] )
    @main.update_attributes( params[:main] )
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
end
