class AddAverageScoreToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :average_score, :float
  end
end
