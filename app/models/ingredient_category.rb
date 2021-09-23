class IngredientCategory < ApplicationRecord


belongs_to :project, optional: true
belongs_to :ingredient
belongs_to :category

end
