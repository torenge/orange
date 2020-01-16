class ChangeDatatypeStatusOfOrderProducts < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_products, :status, :integer
  end
end
