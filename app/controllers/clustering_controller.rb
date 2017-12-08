class ClusteringController < ApplicationController
  def brand
    @records = Brand.all.map { |brand| [brand.name, brand.average_score] }
  end

  def score
    @records = Camera.all.map { |camera| [camera.name, camera.average_score] }
  end
end
