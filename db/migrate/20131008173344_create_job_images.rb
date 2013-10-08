class CreateJobImages < ActiveRecord::Migration
  def change
    create_table :job_images do |t|
      t.string :url
      t.integer :work_id

      t.timestamps
    end
  end
end
