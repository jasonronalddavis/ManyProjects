class CreateIngredientCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredient_categories do |t|
      t.integer :ingredient_id
      t.integer :project_id
      t.integer :category_id

      t.timestamps
    end
  end
end
