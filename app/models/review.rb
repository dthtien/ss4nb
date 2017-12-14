class Review < ApplicationRecord
  default_scope { order(score: :desc) }

  belongs_to :camera

  before_save :set_sentiment, if: :body_changed?
  after_save :set_camera_average_score

  scope :positive, -> { where("score > 0.75") }


  private
    def set_sentiment
      self.sentiment = $analyzer.get_sentiment(body.downcase).sub('-', ' ')
      self.score = $analyzer.get_score(body)
    end

    def set_camera_average_score
      self.camera.update_average_score!
      self.camera.set_sentiment!
    end
end
