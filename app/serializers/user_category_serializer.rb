class UserCategorySerializer
  include FastJsonapi::ObjectSerializer
attributes 
belongs_to :user
belongs_to :project, optional: true
belongs_to :ingredient, optional: true
belongs_to :category
end
