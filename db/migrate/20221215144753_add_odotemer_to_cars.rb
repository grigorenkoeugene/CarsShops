class AddOdotemerToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :odometer, :integer, null: false, default: 0
  end
end
