class Project < ApplicationRecord
has_many :users
has_many :categories
has_many :ingredients
has_many :user_projects
has_many :project_ingredients
has_many :user_ingredients
has_many :project_categories
has_many :users, through: :user_projects
has_many :ingredients, through: :project_ingredients
has_many :categories, through: :project_categories


end
