class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :price
      t.string :url
      t.string :description

      t.timestamps
    end
  end
end
