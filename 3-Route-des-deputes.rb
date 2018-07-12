# liste emails députés

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def perform

page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
#@data_names = page.css("#corps_page > div.contenu_page > div.liste > div.list_table > a.href")
@data_names = page.css("#corps_page div.list_table a div.list_dep")
p @data_names[0..5]

#title pour nom député






end

perform