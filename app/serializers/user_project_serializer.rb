class UserProjectSerializer
  include FastJsonapi::ObjectSerializer
attributes :user_id
belongs_to :user
belongs_to :project
belongs_to :ingredient, optional: true
belongs_to :category, optional: true
end
