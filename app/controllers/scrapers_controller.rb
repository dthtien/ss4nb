class ScrapersController < ApplicationController
  def new
    scraper = Scraper::Dpreview::Scraper.new(2017)
    scraper.scrape_amazon_reviews!
    redirect_to root_path
  end

  def create
    
  end
end
