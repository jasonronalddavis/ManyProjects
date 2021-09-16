class Ingredient < ApplicationRecord
    
    has_many :users
    has_many :projects
    has_many :categories
    has_many :user_ingredients
    has_many :ingredient_categories
    has_many :project_ingrediants
    has_many :categories, through: :project_categories
    has_many :projects, through: :project_ingredients
    has_many :users, through: :user_ingredients
    has_many :users, through: :user_projects
end
