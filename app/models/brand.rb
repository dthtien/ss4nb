class Brand < ApplicationRecord
  has_many :cameras
  has_many  :reviews, through: :cameras

  def self.update_average_scores 
    Brand.all.each do |brand|
      brand.update_average_score
    end
  end

  def update_average_score
    self.update(average_score: self.cameras.average('cameras.average_score').to_f.round(3)
        )
  end
end
