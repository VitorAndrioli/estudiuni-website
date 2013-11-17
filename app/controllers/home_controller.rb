class HomeController < ApplicationController
  
  def index
    @jobs = Job.where("featured = 1").order("RAND()").limit(10)
  end
  
end
