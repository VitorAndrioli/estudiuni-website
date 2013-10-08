class CreateJobs < ActiveRecord::Migration
  def up
    create_table :jobs do |t|
      t.string :name
      t.integer :month
      t.integer :year
      t.text :description
      t.string :cover

      t.timestamps
    end
    Job.creat_translation_table! :name => :string, :description => :text
  end
  
  def down
    drop_table :jobs
    Job.drop_translation_table!
  end
end
