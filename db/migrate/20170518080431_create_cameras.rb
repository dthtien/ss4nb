class CreateCameras < ActiveRecord::Migration[5.0]
  def change
    create_table :cameras do |t|
      t.string :name

      t.timestamps
    end
    add_index :cameras, :name
  end
end
