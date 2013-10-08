# encoding: UTF-8

class Admin::AdminController < ApplicationController
  protect_from_forgery
  layout "admin"
  
  def authenticate
    I18n.locale = :pt
    
    if session[:logged]
      return true
    end
    flash[:warning] = 'Please login to continue'
    redirect_to :controller => "admin", :action => "login"
    return false
  end

  def login
    if params[:user] && Rails.configuration.admin_users[params[:user]] == params[:pass]
      session[:logged] = true
      session[:admin_user] = params[:user]
      redirect_to_stored
    else
      @msg = "Usuário ou senha incorretos"
    end
  end
  
  def logout
    session[:logged] = false
    session[:admin_user] = nil
    redirect_to :controller => "admin", :action => "login"
  end

  def redirect_to_stored
    session[:return_to]=nil
    redirect_to(:controller => "artists", :action => "index")
  end
end
