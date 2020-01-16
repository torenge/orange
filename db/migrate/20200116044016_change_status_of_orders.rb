class ChangeStatusOfOrders < ActiveRecord::Migration[5.2]
  def up
  	change_column_null :orders, :status, false, 0
  	change_column :orders, :status, :integer, default: 0
  end

  def down
  	change_column_null :orders, :status, true, nil
  	change_column :orders, :status, :integer, default: nil
  end
end
