class CamerasController < ApplicationController
  def index
    @cameras = Camera.filter_and_order.search(params[:query]).page(params[:page])
  end

  def show
    @camera = Camera.find(params[:id])
    @reviews = @camera.reviews.page(params[:page])
  end
end
