class ClusteringController < ApplicationController
  def cluste
    @sentiment = params[:clustering].nil? ? 'very_positive' : params[:clustering][:sentiment]
    @cameras = Camera.filter_with_sentiment(@sentiment)
  end
end
