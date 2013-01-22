require 'rubygems'
require 'nokogiri' 
require 'open-uri'

# Get latest Tika release report (i.e. full dump of filter)
doc = Nokogiri::HTML(open('https://s.apache.org/TikaLatestVersionReport'))

names = Array.new
doc.xpath('//a[@class="user-hover"]').each do | user |
	names.push user.content
end

names.uniq.sort.each do | contributor |	
	puts '* ' + contributor,""
end

