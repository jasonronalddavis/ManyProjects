Rails.application.routes.draw do

  namespace :api do

    namespace :v1 do



  root to: 'application#welcome'  


  resources :projects do
    resources :ingredients
    resources :categories
   
  end


  resources :ingredients do
  resources :projects
  resources :categories
 
  end

  resources :categories do
  resources :projects
  resources :ingredients
 
end
end
end
end