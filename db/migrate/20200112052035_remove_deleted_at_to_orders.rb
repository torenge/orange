class RemoveDeletedAtToOrders < ActiveRecord::Migration[5.2]
  def change
  	remove_column :orders, :deleted_at,:datetime
  end
end
