class RenameProductsImageIdColumnToProducts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :products, :products_image_id, :product_image_id
  end
end
