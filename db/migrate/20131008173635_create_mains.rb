class CreateMains < ActiveRecord::Migration
  def up
    create_table :mains do |t|
      t.text :about
      t.string :picture
      t.string :email

      t.timestamps
    end
    Main.create_translation_table! :about => :text
  end
  
  def down
    drop_table :mains
    Main.drop_translation_table!
  end
end
