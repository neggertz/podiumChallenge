require 'rubygems'
require 'nokogiri'
require 'open-uri'
require_relative 'review'

BASE_URL = "https://www.dealerrater.com"
BASE_DIR = "/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page"
LAST_PAGE_NUMBER = 5
REVIEWS_TO_DISPLAY = 3
reviewers = []
reviews = []
ratings = []

#Print Reviews Method
#Description: Takes a presorted list of reviews and displays 1-N reviews Reviewer, Rating & Review Length
#Inputs: A list of Review Objects, Amount of reviews to display
#Returns: None
def printReviews(reviews, amount=1)
	puts "##---------Mackaig Chevrolet's Most Overly Positive Reviews---------##"
	for review in 0.. amount-1 do
		puts "Review ##{review+1}"
		puts " Reviewer: #{reviews[review].reviewer}"
		puts " Rating: #{reviews[review].rating}"
		puts " Length of Review: #{reviews[review].reviewLength} characters"
	end
end


#Scrape reviews from dealer rater for 1--N pages based off LAST_PAGE_NUMBER
#Push reviewer, review and rating to lists to create Review Objects
for page_number in 1.. LAST_PAGE_NUMBER do
	page = Nokogiri::HTML(open("#{BASE_URL}#{BASE_DIR}#{page_number}",
		"User-Agent" => " Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36"))

	tempReviewers = page.css("span.italic.font-18.black.notranslate").map{|reviewer| reviewer.text}
	tempReviews = page.css("p.font-16.review-content.margin-bottom-none.line-height-25").map{|review| review.text}
	tempRatings = page.css("div.col-xs-6.col-sm-12.pad-none.dealership-rating div.rating-static.hidden-xs").map{|rating| rating}
	reviewers.push(*tempReviewers)
	reviews.push(*tempReviews)
	ratings.push(*tempRatings)
end

#Create review objects for each review scraped.
reviewers.zip(reviews,ratings).each do |reviewer, review, rating|
	Review.new reviewer.gsub("- ",""), review, rating.to_s[rating.to_s.index(/\d\d/),2], review.length
end
#Clean up lists
reviewers =nil, reviews = nil, ratings = nil

#Sort Reviews by highest rating and then longest review
sorted = Review.all_instances.sort_by{ |r| [r.rating, r.reviewLength]}.reverse
#Display Results
printReviews(sorted, REVIEWS_TO_DISPLAY)