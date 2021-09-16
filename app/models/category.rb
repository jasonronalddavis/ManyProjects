class Category < ApplicationRecord
    has_many :users
    has_many :user_categories
    has_many :users, through: :user_categories
    has_many :projects
    has_many :ingredients
    has_many :project_categories
    has_many :ingredient_categories
    has_many :user_projects
    has_many :project_ingredients
    has_many :user_ingredients
    has_many :ingredients, through: :project_ingredients
    has_many :ingredients, through: :ingredient_category
    has_many :projects, through: :user_projects
    
end
