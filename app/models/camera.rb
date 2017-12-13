class Camera < ApplicationRecord
  has_many :reviews
  belongs_to :brand

  scope :filter_and_order, -> do
    select("cameras.id, name, cameras.product_link, cameras.image_url, cameras.updated_at, AVG(reviews.score) AS reviews_avg").
    joins(:reviews).
    where("reviews.score > 0.25").
    group("cameras.id").
    order("reviews_avg DESC")
  end

  scope :filter_with_sentiment, -> (sentiment) do
    sentiment = sentiment.nil? ? 'very_positive' : sentiment
    
    distinct
    .joins(:reviews)
    .where(reviews: {sentiment: sentiment})
    .order(average_score: :desc)
  end

  scope :search, -> (query) do
    cameras = if query.blank?
        Camera.all 
      else
        Camera.where("lower(name) LIKE ?", "%#{query.downcase}%")
      end
  end

  after_save :set_brand_average_scores

  def reviews_avg
    read_attribute(:reviews_avg) || cameras.positive.average(:score)
  end

  def self.update_average_scores 
    Camera.all.each do |camera|
      camera.update_average_score
    end
  end

  def update_average_score
    self.update(average_score: self.reviews.average('reviews.score').to_f)
  end

  private
    def set_brand_average_scores
      Brand.update_average_scores
    end
end
