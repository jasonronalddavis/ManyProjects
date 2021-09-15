class IngredientCategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  belongs_to :user, optional: true
belongs_to :project, optional: true
belongs_to :ingredient
belongs_to :category

end
