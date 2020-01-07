class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.integer :genre_id 
		t.string :product_name
		t.string :price 
		t.text :introduction
		t.string :status 
		t.text :product_img_url
		t.datetime :created_at
		t.datetime :updated_at

      t.timestamps
    end
  end
end
