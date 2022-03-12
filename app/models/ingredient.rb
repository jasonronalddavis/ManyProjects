class Ingredient < ApplicationRecord
    
  
    has_many :ingredients
    has_many :project_ingredients
    has_many :project_categories
    has_many :categories, through: :project_categories
    has_many :projects, through: :project_ingredients

end
