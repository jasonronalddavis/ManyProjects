class RemoveIdFromCategory < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user_id
    remove_column :categories, :project_id
    remove_column :categories, :ingredient_id
  end
end
