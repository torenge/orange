class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :deli_address_id
      t.integer :user_id
      t.integer :payment
      t.string :status
      t.string :pay_method
      t.string :postage
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
