require 'colorize'
require 'httparty'
require 'nokogiri'
require 'csv'

#Scraper class
class Scraper
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
end