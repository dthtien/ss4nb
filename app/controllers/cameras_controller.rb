class CamerasController < ApplicationController
  def index
    @cameras = Camera.filter_and_order.search(params[:query]).page(params[:page])
  end

  def show
    @camera = Camera.includes(:reviews).find(params[:id])
    @reviews = @camera.reviews.page(params[:page])
  end
end
