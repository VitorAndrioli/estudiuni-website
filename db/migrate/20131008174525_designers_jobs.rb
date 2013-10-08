class DesignersJobs < ActiveRecord::Migration
  def change
    create_table 'designers_jobs', :id => false do |t|
      t.integer :designer_id
      t.integer :job_id
    end
  end
end
