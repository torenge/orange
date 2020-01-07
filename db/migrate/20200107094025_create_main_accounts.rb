class CreateMainAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :main_accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kana_last_name
      t.string :mail_address
      t.string :password
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
