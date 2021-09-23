class ProjectIngredient < ApplicationRecord

belongs_to :project
belongs_to :ingredient
belongs_to :category, optional: true
end
