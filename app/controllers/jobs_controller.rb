class JobsController < ApplicationController
  
  def index
    @designer = Designer.find( params[:designer_id] )
  end
  
  def show
    @job = Job.find( params[:id] )
    
    if I18n.locale.to_s == "pt"
      @months = ["JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO", "JUNHO", "JULHO", "AGOSTO",
                  "SETEMBRO", "OUTUBRO", "NOVEMBRO", "DEZEMBRO"]
    elsif I18n.locale.to_s == "en"
      @months = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST",
                "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]
    end
      
    if request.path != job_path(@job)
      redirect_to @job, status: :moved_permanently
    end
  end
end
