class AddCarsCountToShop < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :cars_count, :integer, null: false, default: 0
  end
end
