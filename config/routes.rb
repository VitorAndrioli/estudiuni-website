Estudiuni2::Application.routes.draw do
  root :to => 'admin/admin#login'
  
  namespace :admin do
    
    get '', :controller => 'admin', :action => 'login'
    get 'admin/login', :controller => 'admin', :action => 'login'
    post 'admin/login', :controller => 'admin', :action => 'login'  
    get 'admin/logout', :controller => 'admin', :action => 'logout'
    
    resources :main
    
    resources :designers
    
    resources :jobs do
      resources :job_images
    end
    
  end
end
