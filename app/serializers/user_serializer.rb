class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description
  has_many :users
  has_many :user_categories

end
