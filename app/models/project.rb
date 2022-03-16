class Project < ApplicationRecord
    
    has_many :ingredients
    has_many :project_ingredients
    has_many :project_categories
    has_many :categories, through: :project_categories
    has_many :ingredients, through: :project_ingredients

    validates :name, length: { minimum: 3, :too_short => "needs at leat 5 characters" }
    validates :name, presence:  { message: "must be given please" }
    validates :description, length: { minimum: 3, :too_short => "needs at leat 20 characters" }
    validates :description, presence:  { message: "must be given please" }
    validates :total_price, presence:  { message: "must be given please" }

end
