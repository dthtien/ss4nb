class AddBrandIdToCameras < ActiveRecord::Migration[5.0]
  def change
    add_reference :cameras, :brand, foreign_key: true
  end
end
