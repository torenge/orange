class RenameProductImgUrlColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :product_img_url, :products_image_id
  end
end
