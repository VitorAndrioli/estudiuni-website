class ForSaleItemsController < ApplicationController
  def index
    @designer = Designer.find( params[:designer_id] )
  end
  
  def show
    @for_sale_item = ForSaleItem.find( params[:id] )
    
    if request.path != for_sale_item_path(@for_sale_item)
      redirect_to @for_sale_item, status: :moved_permanently
    end
  end
end
