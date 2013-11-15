class LocalesController < ApplicationController
  
  def set
    if (params[:locale] == "pt")
      session[:locale] = I18n.locale = :pt
    elsif (params[:locale] == "en")
      session[:locale] = I18n.locale = :en
    end
    render :json => { :status => :ok }
  end
end
