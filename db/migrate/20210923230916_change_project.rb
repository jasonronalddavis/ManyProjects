class ChangeProject < ActiveRecord::Migration[6.1]
  def change
    change_column :projects, :total_price, :decimal
  end
end
