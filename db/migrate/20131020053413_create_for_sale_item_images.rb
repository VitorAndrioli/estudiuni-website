class CreateForSaleItemImages < ActiveRecord::Migration
  def change
    create_table :for_sale_item_images do |t|
      t.string :url
      t.integer :for_sale_item_id
      t.integer :position

      t.timestamps
    end
  end
end
