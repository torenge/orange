class ChangeStatusOfOrderProducts < ActiveRecord::Migration[5.2]
  def up
  	change_column_null :order_products, :status, false, 0
  	change_column :order_products, :status, :integer, default: 0
  end

  def down
  	change_column_null :order_products, :status, true, nil
  	change_column :order_products, :status, :integer, default: nil
  end
end
