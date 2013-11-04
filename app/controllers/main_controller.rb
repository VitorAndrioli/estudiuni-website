class MainController < ApplicationController
  
  def about
    @estudiuni = Main.first
  end
  
  def jobs
    @estudiuni = Main.first
    @jobs = Job.all
  end
end
