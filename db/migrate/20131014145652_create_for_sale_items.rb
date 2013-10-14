class CreateForSaleItems < ActiveRecord::Migration
  def up
    create_table :for_sale_items do |t|
      t.string :name
      t.text :description
      t.string :cover

      t.timestamps
    end
    ForSaleItem.create_translation_table! :name => :string, :description => :text
  end
  
  def down
    drop_table :for_sale_items
    ForSaleItem.drop_translation_table!
  end
end
