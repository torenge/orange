class CreateDeliAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deli_addresses do |t|
      t.integer :user_id
      t.text :address
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kana_last_name
      t.integer :postal_code
      t.integer :tel_num
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
