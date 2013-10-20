class Admin::ForSaleItemImagesController < Admin::AdminController
  
  before_filter :authenticate
  
  def index
    ForSaleItemImage.consolidate_positions( params[:for_sale_item_id] || params[:for_sale_item] )
    @for_sale_item = ForSaleItem.find( params[:for_sale_item_id] )
    @for_sale_item_images = @for_sale_item.for_sale_item_images
  end
  
  def new
    @for_sale_item = ForSaleItem.find( params[:for_sale_item_id] )
    @for_sale_item_image = ForSaleItemImage.new
    @for_sale_item_image.for_sale_item = @for_sale_item
    
    respond_to do |format|
      format.html #new.html.erb
    end
  end
  
  def create
    @for_sale_item_image = ForSaleItemImage.new( params[:for_sale_item_image] )
    @for_sale_item_image.save
    
    respond_to do |format|
      if @for_sale_item_image.save
        format.html { redirect_to(:action => "index", :for_sale_item_id => @for_sale_item_image.for_sale_item.id) }
      else
        format.html { redirect_to(:action => "new") }
      end
    end
  end
  
  def destroy
    for_sale_item_image = ForSaleItemImage.find( params[:id] )
    for_sale_item = for_sale_item_image.for_sale_item
    for_sale_item_image.delete
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :for_sale_item_id => for_sale_item.id) }
    end
  end
  
  def up
    image = ForSaleItemImage.find(params[:id])
    if image.position > 0
      previous_images = ForSaleItemImage.where("position = ? and for_sale_item_id = ?", image.position - 1, image.for_sale_item.id).limit(1)
      if previous_images and previous_images.length > 0
        previous_image = previous_images[0]
        previous_image.position = image.position
        image.position = image.position - 1        
        previous_image.save
        image.save
      end
    end
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :for_sale_item_id => image.for_sale_item.id) }
    end
  end
  
  def down
    image = ForSaleItemImage.find(params[:id])
    next_images = ForSaleItemImage.where("position = ? and for_sale_item_id = ?", image.position + 1, image.for_sale_item.id).limit(1)
    if next_images and next_images.length > 0
      next_image = next_images[0]
      next_image.position = image.position
      image.position = image.position + 1       
      next_image.save
      image.save
    end
    
    respond_to do |format|
      format.html { redirect_to(:action => "index", :for_sale_item_id => image.for_sale_item.id) }
    end
  end
end
