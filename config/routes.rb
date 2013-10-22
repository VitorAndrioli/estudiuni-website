Estudiuni2::Application.routes.draw do
  root :to => 'home#index'
  
  namespace :admin do
    
    get '', :controller => 'admin', :action => 'login'
    get 'admin/login', :controller => 'admin', :action => 'login'
    post 'admin/login', :controller => 'admin', :action => 'login'  
    get 'admin/logout', :controller => 'admin', :action => 'logout'
    
    resources :main
    
    resources :designers
    
    resources :jobs do
      resources :job_images
      get 'job_images/:id/up', :controller => 'job_images', :action => 'up'
      get 'job_images/:id/down', :controller => 'job_images', :action => 'down'
    end
    
    resources :for_sale_items do
      resources :for_sale_item_images
      get 'for_sale_images/:id/up', :controller => 'for_sale_item_images', :action => 'up'
      get 'for_sale_images/:id/down', :controller => 'for_sale_item_images', :action => 'down'
    end
    
  end
  
  resources :home
  resources :jobs
  resources :designers
  resources :for_sale_items
  
end
