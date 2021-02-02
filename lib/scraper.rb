require 'colorize'
require 'httparty'
require 'nokogiri'
require 'csv'

#Scraper class
class Scraper

  attr_reader :url, :gadgets, :page
  def initialize 
  @url = 'https://www.jumia.com.ng/smartphones/'
  @gadgets = Array.new
  @page = 1
  end

  def url_data(url)
    doc = HTTParty.get(url)
    Nokogiri::HTML(doc.body)
  end

  def new_url_data(url)
    new_url = "https://www.jumia.com.ng/smartphones/?page=#{@page}#catalog-listing"
    new_doc = HTTParty.get(new_url)
    Nokogiri::HTML(new_doc.body)
  end

  def scraper
    file = url_data(@url)
    items = file.css('div.info')
    total_pages = 2400
    last_page =50
    CSV.open("file.csv", "wb") do |csv|
      while @page <= 40
        new_file = new_url_data(@new_url)
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