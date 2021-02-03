require 'colorize'
require 'httparty'
require 'nokogiri'
require 'csv'

# Scraper class
class Scraper
  attr_accessor :url, :gadgets, :page

  def initialize
    @url = 'https://www.jumia.com.ng/smartphones/'
    @gadgets = []
    @page = 1
  end

  private

  def url_data(_page)
    url = if @page.nil?
            @url
          else
            "https://www.jumia.com.ng/smartphones/?page=#{@page}#catalog-listing"
          end
    doc = HTTParty.get(url)
    Nokogiri::HTML(doc.body)
  end

  public

  def scraper
    file = url_data(@url)
    file.css('div.info')
    CSV.open('file.csv', 'wb') do |csv|
      while @page <= 40
        new_file = url_data(@new_url)
        new_items = new_file.css('div.info')
        new_items.each do |item|
          name = item.css('h3.name').text
          price = item.css('div.prc').text
          discount_price = item.css('div.old').text
          rating = item.css('div.rev').text
          @gadgets.push(name.blue, price.green, discount_price.yellow, rating.red)
          csv << [name, price, discount_price, rating]
        end
        @page += 1
        puts @gadgets

      end
    end
  end
end
