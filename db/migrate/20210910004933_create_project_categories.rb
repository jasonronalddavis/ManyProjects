class CreateProjectCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :project_categories do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.integer :project_id
      t.integer :category_id

      t.timestamps
    end
  end
end
