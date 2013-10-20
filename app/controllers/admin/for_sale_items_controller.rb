class Admin::ForSaleItemsController < Admin::AdminController
  
  before_filter :authenticate
  
  def index
    @for_sale_items = ForSaleItem.all
  end

  def new
    @for_sale_item = ForSaleItem.new
    
    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
  def create
    @for_sale_item = ForSaleItem.create( params[:for_sale_item] )
    
    respond_to do |format|
      if @for_sale_item.save
        format.html { redirect_to(:action => "index")}
      else
        format.html { redirect_to(:action => "new")}
      end
    end
  end

  def edit
    @for_sale_item = ForSaleItem.find( params[:id] )
  end

  def update
    @for_sale_item = ForSaleItem.find( params[:id] )
    @for_sale_item.update_attributes( params[@for_sale_item] )
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
  
  def destroy
    for_sale_item = ForSaleItem.find( params[:id] )
    for_sale_item.delete
    
    respond_to do |format|
      format.html { redirect_to(:action => "index") }
    end
  end
end
