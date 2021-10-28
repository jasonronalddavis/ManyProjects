class Category < ApplicationRecord
    
   
  
    has_many :projects
    has_many :ingredients
    has_many :project_categories
    has_many :ingredient_categories
    has_many :project_ingredients
    has_many :ingredients, through: :project_ingredients
    has_many :ingredients, through: :ingredient_categories
    has_many :projects, through: :project_categories
    
end
