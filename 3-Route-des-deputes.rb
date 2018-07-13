# liste emails députés

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def perform
	
	puts "Merci de patienter, le programme est en train de scrapper.."
	
		def parse_name
			page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))	
			data_names = page.css("#corps_page div.list_table a div span.list_nom")		
			array_of_name = []
			data_names.each do |depute| 
					array_of_name << {"name" => depute.text.delete("\n,").rstrip.delete_prefix("      ").split(" ") }
				end
			array_hash_last_first_name = []
			array_of_name.each do |name_hash| 
					name_hash.each do |key, value| 
						array_hash_last_first_name << {"lastname" => value[0], "firstname" => value[1] }
					end 
				end
			return array_hash_last_first_name
		end


		def parse_links
			page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
			data_links = page.css("#corps_page div.contenu_page div.liste div.list_table a")
			array_of_links = []
			data_links.each do |link_townhall| array_of_links << link_townhall['href']
			end
			return array_of_links
		end
		

		def parse_email(url_depute)
			array_of_emails = []
			url_depute.each do |link| 
			page_depute = Nokogiri::HTML(open("https://www.nosdeputes.fr/#{link}"))
			array_of_emails << {"email" => page_depute.css("#b1 > ul[4] > li[1] > ul > li[1] > a[href]").text.delete_prefix("mailto:") }
				end
			return array_of_emails
		end

		list_emails = parse_email(parse_links)
		p parse_name.zip(list_emails)

end

perform