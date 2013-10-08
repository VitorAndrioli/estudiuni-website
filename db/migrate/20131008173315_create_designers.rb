class CreateDesigners < ActiveRecord::Migration
  def up
    create_table :designers do |t|
      t.string :name
      t.text :about
      t.string :facebook
      t.string :blogger
      t.string :behance
      t.string :linkedin
      t.string :vimeo
      t.string :pinterest
      t.string :image
      t.string :email
      t.string :surname
      
      t.timestamps
    end
    Designer.create_translation_table! :about => :text
  end
  
  def down
    drop_table :designers
    Designer.drop_translation_table!
  end
end
