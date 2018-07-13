# crypto monnaies

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def perform

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
@data_name = page.css("#currencies-all > tbody[2] > tr > td[2]")
@data_prices = page.css("#currencies-all > tbody[2] > tr > td[5] > a.price")


	def parse_name	
		array_of_name = []
		@data_name.each do |crypto_name| array_of_name << {"name" => crypto_name['data-sort']	}
			end

		return array_of_name
	end

	def parse_prices
		array_of_price = []
		@data_prices.each do |crypto_price| array_of_price << {"price" => crypto_price['data-usd'] }
			end
		return array_of_price
	end
	p parse_name.zip(parse_prices)
end

perform

#loop do
#  t = Time.now
#	perform
# sleep(t + 1 - Time.now)
#end


