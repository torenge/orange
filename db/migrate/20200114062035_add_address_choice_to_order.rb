class AddAddressChoiceToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :address_choice, :string
  end
end
