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
  
  get '/about', :controller => 'main', :action => 'about'
  get '/jobs', :controller => 'main', :action => 'jobs'
  
  resources :home, only: [:index]
  resources :for_sale_items
  resources :contacts, only: [:index], :path => 'contact'
  
  get 'designers', :controller => 'designers', :action => 'index'
  get ':id', :controller => 'jobs', :action => 'show'
  get ':designer_id/jobs', :controller => 'jobs', :action => 'index'
  get ':designer_id/shop', :controller => 'for_sale_items', :action => 'index'
  #get ':designer_id/jobs/:id', :controller => 'jobs', :action => 'show'
  
  get 'shop/:id', :controller => 'for_sale_items', :action => 'show'
  get ':designer_id/shop', :controller => 'for_sale_items', :action => 'index'
  #get ':designer_id/shop/:id', :controller => 'jobs', :action => 'show'
  
  resources :jobs
  resources :designers
  resources :for_sale_items
  
end
