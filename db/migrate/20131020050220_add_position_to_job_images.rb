class AddPositionToJobImages < ActiveRecord::Migration
  def change
    add_column :job_images, :position, :integer
  end
end
