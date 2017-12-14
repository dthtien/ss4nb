class ClusteringController < ApplicationController
  def cluste
    if params[:clustering]
      @sentiment = Camera.filter_with_options(params[:clustering])
    end
  end
end
