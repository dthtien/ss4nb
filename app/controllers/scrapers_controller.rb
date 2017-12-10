class ScrapersController < ApplicationController
  def new
  end

  def create
    year = params[:scrapers][:year]
    if year.blank?
      render :new
    else
      ScraperWorker.perform_async(year)
      flash[:notice] = "Scraping data of year #{year}!"
      redirect_to root_path
    end
  end
end
