class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :image_url, :url, :price, :categories, :projects


 

has_many :project_ingredients
has_many :project_categories
has_many :categories, through: :project_categories
has_many :projects, through: :project_ingredients




end
