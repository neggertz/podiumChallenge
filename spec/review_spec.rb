require_relative '../review'

describe Review  do 

	before :each do
		@review = Review.new "John", "Good", "50", "4"
	end

	describe "#new" do
		it "returns a new Review object" do
			expect(@review).to be_an_instance_of Review
		end
	end

	describe "#reviewer" do
		it "returns the correct reviewer name" do
			expect(@review.reviewer).to eq("John")
		end
	end

	describe "#review" do
		it "returns the correct review" do
			expect(@review.review).to eq("Good")
		end
	end

	describe "#rating" do
		it "returns the correct rating" do
			expect(@review.rating).to eq("50")
		end
	end

	describe "#reviewLength" do
		it "returns the correct rating" do
			expect(@review.reviewLength).to eq("4")
		end
	end


end