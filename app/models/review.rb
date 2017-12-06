class Review < ApplicationRecord
  default_scope { order(score: :desc) }

  belongs_to :camera

  before_save :set_sentiment, if: :body_changed?

  scope :positive, -> { where("score > 0.75") }

  private
    def set_sentiment
      self.sentiment = $analyzer.get_sentiment(body).sub('-', ' ')
      self.score = $analyzer.get_score(body)
    end
end
