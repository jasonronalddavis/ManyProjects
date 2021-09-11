class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :category
  has_many :user
end
