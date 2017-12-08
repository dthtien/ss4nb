require 'open-uri'
require 'nokogiri'
require 'json'

module Scraper::Dpreview
  class Scraper
    REVIEWS_URL = "https://www.dpreview.com/products/amazon-customer-reviews"

    attr_reader :year
    attr_accessor :data

    def self.get_data_from(url)
      retries = 0

      doc = Nokogiri::HTML open(url)

      return unless doc.at_css('#productPageTabs .tabs').text().include? 'Amazon'
      brand = doc.css('.breadcrumbs a.item')[1]
      image_url = doc.at_css('#productImage').attr('style')[/http.+(png|jpg)/]
      product_link = 'https://dpreview.com' + doc.at_css('li.leftmost.selected a.maintab').attr('href')

      {
        brand: "#{brand.text if brand}",
        image_url: image_url,
        product_link: product_link,
        name: doc.at_css('.headerContainer h1')&.text,
        amazon_reviews: get_amazon_reviews_from(url)
      }
    end

    def initialize(year)
      @year = year.to_s
      @data = []
    end

    def scrape_amazon_reviews!
      urls = get_camera_urls
      size = urls.size

      urls.each_with_index do |url, index|
        puts index

        if reviews_data = Scraper.get_data_from(url)
          scraped_data = reviews_data
          brand = Brand.find_or_create_by(name: scraped_data[:brand])
          camera = Camera.find_or_create_by(name: scraped_data[:name],
            image_url: scraped_data[:image_url],
            product_link: scraped_data[:product_link],
            brand_id: brand.id)
          Review.create(scraped_data[:amazon_reviews].map { |r| {body: r, camera: camera} })
        end

        yield(size, index) if block_given?
      end
    end

    def save_data!
      data.each do |d|
        brand = Brand.find_or_create_by(name: d['brand'])
        camera = Camera.find_or_create_by(name: d['name'], brand: brand)
        Review.create d['amazon_reviews'].map { |r| {body: r, camera: camera} }
      end
      # File.write "lib/data/#{year.gsub(' ', '-')}.json", data.to_json
    end

    private
      def self.get_amazon_reviews_from(url)
        product_name = url[/[^\/]+$/]
        reviews_data = []
        i = 0

        loop do
          reviews_page = open(
            "#{REVIEWS_URL}?product=#{product_name}&pageIndex=#{i}", &:read)
          data = JSON.parse(
            reviews_page.sub('AmazonCustomerReviews(', '').chomp(')')
          )

          break if data['reviews'].empty?

          reviews_data << data['reviews']
            .select { |review| review['rating'] > 2 }
            .map { |review| review['content'] }

          i += 1
        end

        reviews_data.flatten
      end

      def get_camera_urls
        doc = Nokogiri::HTML(
          open("https://www.dpreview.com/products/cameras/all?view=list")
        )
        puts "Initializing ..."

        label_index = doc.css('.groupLabel').map(&:text).index(year) + 1
        doc.css(".productList tbody:nth-of-type(#{label_index}) .name a")
          .map { |title| title.attr('href') }
      end
  end
end
