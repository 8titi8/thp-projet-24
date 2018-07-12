#route de la Mairie

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def perform


	def get_the_email_of_a_townhall_from_its_webpage(array_of_link)
		array_of_link.each do |link|
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{link}"))
		puts @email = page.css("div main section[2] div table tbody tr[4] td[2]").text
		end
		return @email
	end


	def get_all_the_urls_of_val_doise_townhalls
		
		page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
		@data = page.css('a.lientxt')

		#creation tableau avec les noms de ville
		array_of_name = []
		@data.each do |name_town| array_of_name << name_town.text
			end
			 
		# creation tableau des liens html de chaque ville
		array_of_links = []
		@data.each do |link_townhall| array_of_links << link_townhall['href']
		end
		
		# creation nouveau tableau avec retrait des "." devant les liens 
		array_links_no_dot = []
		array_of_links.collect { |link| array_links_no_dot << link.delete_prefix(".") }

		return array_links_no_dot
	end

 	list_emails = []
	get_the_email_of_a_townhall_from_its_webpage(get_all_the_urls_of_val_doise_townhalls).each do |email| list_emails << {"email" => email}
	 	end


	array_hash_name = []
 	@data.each do |name_town| array_hash_name << {"name" => name_town.text }
 		end

 	p name_link_townhalls = array_hash_name.zip(list_emails)

end

perform