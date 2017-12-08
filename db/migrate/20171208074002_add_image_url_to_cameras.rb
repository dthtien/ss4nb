class AddImageUrlToCameras < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :image_url, :string
  end
end
