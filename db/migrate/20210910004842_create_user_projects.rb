class CreateUserProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :user_projects do |t|
      t.integer :user_id 
      t.timestamps
    end
  end
end
