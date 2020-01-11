class AddDeletedAtToDeliAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :deli_addresses, :deleted_at, :datetime
  end
end
