class AddQuantityToOrderProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :quantity, :integer
  end
end
