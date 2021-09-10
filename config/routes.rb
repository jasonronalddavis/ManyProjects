Rails.application.routes.draw do
  resources :project_ingredients
  resources :user_categories
  resources :ingredients
  resources :ingredient_categories
  resources :project_categories
  resources :user_ingredients
  resources :product_ingredients
  resources :user_projects
  resources :categories
  resources :projects
  resources :items
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
