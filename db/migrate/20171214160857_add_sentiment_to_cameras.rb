class AddSentimentToCameras < ActiveRecord::Migration[5.0]
  def change
    add_column :cameras, :sentiment, :string
  end
end
