class AddSlugToForSaleItems < ActiveRecord::Migration
  def change
    add_column :for_sale_items, :slug, :string
    add_index :for_sale_items, :slug
  end
end
