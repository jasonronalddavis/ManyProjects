class UserCategorySerializer
  include FastJsonapi::ObjectSerializer
attributes :category_id, :user_id, :user
belongs_to :user
belongs_to :category, optional: true
belongs_to :project, optional: true
belongs_to :ingredient, optional: true

end
