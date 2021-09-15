class User < ApplicationRecord
    has_many :categories
    has_many :user_categories
    has_many :added_categories, through: :user_categories, source: category
    has_secure_password
    has_many :projects
    has_many :ingredients
    has_many :user_projects
    has_many :user_ingredients
    has_many :projects, through: :user_projects
    has_many :ingrediants, through: :user_ingediants
   
    

end
