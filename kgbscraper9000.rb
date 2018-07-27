require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

puts 'hello world'

# requestHeaders =  Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8
# Accept-Encoding: gzip, deflate, br
# Accept-Language: en-US,en;q=0.9
# Cache-Control: max-age=0
# Connection: keep-alive
# Cookie: __dr_env=production; dealerId=23685; mp.dealers=23685; __utmc=214773634; __utmz=214773634.1532718544.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _vwo_uuid_v2=D304B094B393DEBDD02D7DFD38E882106|0e9ed1cca3352286e612a6074b20de06; _localization=%7B%22PromptIsVisible%22%3Afalse%7D; __utma=214773634.1331830809.1532718544.1532718544.1532722832.2; ASP.NET_SessionId=3abu4bkdgm5nnfqiegfqv0jw; mp.crossshopping=7,9,51,49; firstPage=https://www.dealerrater.com/sales/Dennis-Smith-review-507162/; __utmb=214773634.30.8.1532725321075; mp_59f93360967cd175f5e8c1f42203479e_mixpanel=%7B%22distinct_id%22%3A%20%22164dd24fda7520-0772c6376128c7-33697b07-13c680-164dd24fda823a%22%2C%22%24initial_referrer%22%3A%20%22%24direct%22%2C%22%24initial_referring_domain%22%3A%20%22%24direct%22%7D
# DNT: 1
# Host: www.dealerrater.com
# Upgrade-Insecure-Requests: 1
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36



page = Nokogiri::HTML(open("https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1",
	"User-Agent" => " Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"))

puts page