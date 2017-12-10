class ScraperWorker
  include Sidekiq::Worker

  def perform(year)
    scraper = Scraper::Dpreview::Scraper.new(year)
    scraper.scrape_amazon_reviews!
  end
end
