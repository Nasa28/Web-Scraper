# spec/scraper_spec.rb
require_relative '../lib/scraper'

describe Scraper do
  let(:scrape) { Scraper.new }
  describe '#initialize' do
    it 'sets the url' do
      expect(scrape.url).to be_a(String)
    end

    it 'sets the url' do
      expect(scrape.url).not_to be Numeric
    end

    it 'sets gadgets to an empty array' do
      expect(scrape.gadgets.empty?).to eq(true)
    end

    it 'page should be a numeric and 1' do
      expect(scrape.page.is_a?(Numeric)).to eq(true)
    end

    it 'page should be a numeric and 1' do
      expect(scrape.page.is_a?(String)).not_to eq(true)
    end

    it 'page should be a numeric and 1' do
      expect(scrape.page.is_a?(String)).to eq(false)
    end
    it 'page should be a numeric and 1' do
      expect(scrape.page).to eql(1)
    end

    it 'page should be a numeric and 1' do
      expect(scrape.page).not_to be 5
    end
  end
end
