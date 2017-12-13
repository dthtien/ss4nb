class ClusteringController < ApplicationController
  def cluste
    @cameras = Camera.filter_with_parameter(params[:sentiment])
  end
end
