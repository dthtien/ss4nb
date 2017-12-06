class Camera < ApplicationRecord
  has_many :reviews

  scope :filter_and_order, -> do
    select("cameras.id, name, cameras.updated_at, AVG(reviews.score) AS reviews_avg").
    joins(:reviews).
    where("reviews.score > 0.25").
    group("cameras.id").
    order("reviews_avg DESC")
  end

  scope :search, -> (query) do
    cameras = if query.blank?
        Camera.all 
      else
        Camera.where("lower(name) LIKE ?", "%#{query.downcase}%")
      end
  end

  def reviews_avg
    read_attribute(:reviews_avg) || cameras.positive.average(:score)
  end
end
