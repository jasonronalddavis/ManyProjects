class ProjectIngredient < ApplicationRecord

belongs_to :project, optional: true
belongs_to :ingredient, optional: true
belongs_to :category, optional: true
end
