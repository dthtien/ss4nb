class AddAverageScoreToCameras < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :average_score, :float
  end
end
