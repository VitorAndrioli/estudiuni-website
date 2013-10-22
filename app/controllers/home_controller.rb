class HomeController < ApplicationController
  
  def index
    @jobs = Job.where("featured = 1")
  end
  
end
