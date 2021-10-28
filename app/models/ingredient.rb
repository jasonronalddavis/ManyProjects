class Ingredient < ApplicationRecord
    
   
    has_many :projects
    has_many :categories
    has_many :ingredient_categories
    has_many :project_ingrediants
    has_many :categories, through: :ingredient_categories
    has_many :projects, through: :project_ingredients
 
end
