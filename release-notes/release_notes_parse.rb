#!/usr/bin/env ruby

require 'rubygems'
require 'nokogiri' 
require 'open-uri'

if ARGV.empty?
  puts "Usage: release_notes_parse.rb tikaVersion"
  exit 1
end

# Get latest Tika release report (i.e. full dump of filter)
doc = Nokogiri::HTML(open("https://issues.apache.org/jira/sr/jira.issueviews:searchrequest-printable/temp/SearchRequest.html?jqlQuery=project+%3D+TIKA+AND+fixVersion+%3D+#{ARGV[0]}&tempMax=100"))

names = Array.new
doc.xpath('//a[@class="user-hover"]').each do | user |
	names.push user.content
end

names.uniq.sort.each do | contributor |	
	puts '* ' + contributor,""
end

