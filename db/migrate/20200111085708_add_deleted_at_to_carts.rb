class AddDeletedAtToCarts < ActiveRecord::Migration[5.2]
  def change
    add_column :carts, :deleted_at, :datetime
  end
end
