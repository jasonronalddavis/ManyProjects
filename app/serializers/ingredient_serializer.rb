class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :image_url, :url, :price, :categories, :projects


  has_many :projects
  has_many :categories
  has_many :ingredient_categories
  has_many :project_ingrediants
  has_many :categories, through: :ingredient_categories
  has_many :projects, through: :project_ingredients






end
