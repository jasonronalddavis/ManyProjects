Rails.application.routes.draw do

  namespace :api do

    namespace :v1 do



  root to: 'application#welcome'  


  resources :users do
  resources :products
  resources :ingredients
  resources :categories
  end

  resources :projects do
    resources :ingredients
    resources :categories
    resources :users
  end


  resources :ingredients do
  resources :projects
  resources :categories
  resources :users
  end

  resources :categories do
  resources :projects
  resources :ingredients
  resources :users
end
end
end
end