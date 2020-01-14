class AddFirsrNameToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :first_name, :string
  end
end
