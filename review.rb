#Review to hold information scraped from dealer rater
class Review 
	@@array = Array.new
	attr_accessor :reviewer, :review, :rating, :reviewLength,
	def self.all_instances
		@@array
	end
	
	def initialize (reviewer, review, rating, reviewLength)
		@reviewer = reviewer
		@review = review
		@rating = rating
		@reviewLength = reviewLength
		@@array << self
	end
end