class AddParamenterToCameras < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :pixels, :string
    add_column :cameras, :sensor, :string
    add_column :cameras, :iso, :string
    add_column :cameras, :lens, :string
    add_column :cameras, :screen_size, :string
    add_column :cameras, :weight, :string
    add_column :cameras, :dimensions, :string
  end
end
