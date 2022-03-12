class Project < ApplicationRecord
    has_many :ingredients
    has_many :project_ingredients
    has_many :project_categories
    has_many :categories, through: :project_categories
    has_many :ingredients, through: :project_ingredients


end
