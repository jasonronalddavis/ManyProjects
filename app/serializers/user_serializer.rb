class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :category_ids
  has_many :user_categories
  has_many :categories
  has_many :projects
  has_many :user_projects
end
