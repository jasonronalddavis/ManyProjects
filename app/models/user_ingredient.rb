class UserIngredient < ApplicationRecord
belongs_to :user
belongs_to :project, optional: true
belongs_to :ingredient
belongs_to :category, optional: true
end
