module Sentimentable
  extend ActiveSupport::Concern
  included do
    def self.filter_with_options(options)
      sentiments = Hash.new 0
      cameras = self.where("pixels = ? AND
        sensor = ? AND 
        iso = ? AND
        lens = ? AND
        screen_size = ? AND
        weight = ? AND
        dimensions = ?", options['pixels'], options['sensor'], options['iso'],
          options['lens'], options['screen_size'], options['weight'], options['dimensions'])

      if cameras.blank?
        self.where("pixels = ? OR
          sensor = ? OR 
          iso = ? OR
          screen_size = ? OR
          weight = ? OR
          dimensions = ?", options['pixels'], options['sensor'], options['iso'], options['screen_size'], options['weight'], options['dimensions'])
          .pluck(:sentiment).each do |sentiment|
            sentiments[sentiment] += 1
          end
        else
          cameras.pluck(:sentiment).each do |sentiment|
            sentiments[sentiment] += 1
          end
        end
      sentiments.blank? ? "Not found" : largest_hash_key(sentiments).first
    end
  end
end