module Scraper
  class Scraper
    def initialize(year)
      @year = year
    end

    def execute
      get_data
      analyzer
    end
    
    private
      def get_data
        scraper = Scraper::Dpreview::Scraper.new(@year)
        scraper.scrape_amazon_reviews
        scraper.save
      end

      def analyzer
        Scraper::Dpreview::Analyzer.load_senti_dics

        # Example
        analyzer = Scraper::Dpreview::Analyzer.new(@year)
        analyzer.sort(objectivity: 0.25, by: 'asc')
        analyzer.save
      end
  end
end