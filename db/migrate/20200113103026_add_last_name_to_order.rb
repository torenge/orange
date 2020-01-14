class AddLastNameToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :last_name, :string
  end
end
