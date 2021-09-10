class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :user_id
      t.integer :ingredient_id
      t.integer :project_id

      t.timestamps
    end
  end
end
