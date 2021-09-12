class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :users, class_name: 'User'
end
