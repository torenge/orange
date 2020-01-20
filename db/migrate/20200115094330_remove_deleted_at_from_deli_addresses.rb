class RemoveDeletedAtFromDeliAddresses < ActiveRecord::Migration[5.2]
  def change
    remove_column :deli_addresses, :deleted_at, :datetime
  end
end
