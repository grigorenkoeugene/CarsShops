class AddShopIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :shop, null: false, foreign_key: true
  end
end
