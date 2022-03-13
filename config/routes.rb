Rails.application.routes.draw do

  namespace :api do

    namespace :v1 do



  root to: 'application#welcome'  
 post "projects/update", to: "projects#update"
 
 

  resources :projects do   
    resources :ingredients
    resources :categories
   
  end



  post "ingredients/update", to: "ingredients#update"
 


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