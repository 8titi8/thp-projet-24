# liste emails députés

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def perform


	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	#@data_names = page.css("#corps_page > div.contenu_page > div.liste > div.list_table > a.href")
	@data_names = page.css("#corps_page div.list_table a div span.list_nom")

	link = "/damien-abad"

	page_depute = Nokogiri::HTML(open("https://www.nosdeputes.fr/#{link}"))
	@data_emails = page_depute.css("#b1 > ul[4] > li[1] > ul > li[1] > a")

		def parse_name	
			
			array_of_name = []
			@data_names.each do |depute| array_of_name << {"name" => depute.text.delete("\n,").rstrip.delete_prefix("      ").split(" ") }
				end
			array_hash_last_first_name = []
			array_of_name.each do |name_hash| 
					name_hash.each do |key, value| 
						array_hash_last_first_name << {"lastname" => value[0], "firstname" => value[1] }
					end 
				end
			return array_hash_last_first_name
		end

		parse_name
		

		def parse_email
			array_of_emails = []
			@data_emails.each do |email| array_of_emails << {"email" => email['href'] }
				end

			return array_of_emails
		end

	#p parse_email




end

perform