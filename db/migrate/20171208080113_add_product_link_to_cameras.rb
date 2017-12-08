class AddProductLinkToCameras < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :product_link, :string
  end
end
