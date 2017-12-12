class CamerasController < ApplicationController
  def index
    @cameras = Camera.search(params[:query]).order(average_score: :desc).page(params[:page])
  end

  def show
    @camera = Camera.includes(:reviews).find(params[:id])
    @reviews = @camera.reviews.page(params[:page])
  end
end
