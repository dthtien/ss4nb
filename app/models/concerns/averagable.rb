module Averagable
  extend ActiveSupport::Concern

  included do
    def self.update_average_scores 
      self.all.each do |record|
        record.update_average_score
      end
    end

    private
      def update_average_score
        self.update(average_score: self.reviews.average('reviews.score').to_f.round(3)
            )
      end
  end
end