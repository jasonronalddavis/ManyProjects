class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :total_price, :ingredients, :categories


  
  has_many :ingredients
  has_many :project_ingredients
  has_many :project_categories
  has_many :categories, through: :project_categories
  has_many :ingredients, through: :project_ingredients


end
