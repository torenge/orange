class ChangeIntegerTelNumToUsers < ActiveRecord::Migration[5.2]
  def up
  	change_column :users, :tel_num, :string
  	change_column :deli_addresses,:tel_num,:string
  	change_column :deli_addresses,:postal_code,:string
  end
end
