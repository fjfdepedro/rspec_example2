# spec/checkout_spec.rb
require "checkout"
require 'offer1'
require 'offer2'

describe Checkout do

	describe "Methods of clash Checkout" do
		it "responds to '.scan'" do
				  expect(Checkout.new("x-or-more-tshirt,2-for-1-voucher")).to respond_to(:scan)
		end
		it "responds to '.total'" do
				  expect(Checkout.new("x-or-more-tshirt,2-for-1-voucher")).to respond_to(:total)
		end
	end

	describe "Complete example, order: 3 VOUCHER, 3 TSHIRT and 1 MUG" do

	    context "Number 1: apply two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt,2-for-1-voucher")		

		    	3.times do
		    		@ejemplo1.scan("VOUCHER")
		    	end
		    	3.times do
					@ejemplo1.scan("TSHIRT")
				end
				@ejemplo1.scan("MUG")
		    end

	        it "returns 74.5" do
	          expect(@ejemplo1.total).to eql(74.5)
	        end
	 	end

	 	context "Number 2: apply offer -> x-or-more-tshirt" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt")		

		    	3.times do
		    		@ejemplo1.scan("VOUCHER")
		    	end
		    	3.times do
					@ejemplo1.scan("TSHIRT")
				end
				@ejemplo1.scan("MUG")
		    end

	        it "returns 79.5" do
	          expect(@ejemplo1.total).to eql(79.5)
	        end
	 	end

	 	context "Number 3: apply offer -> 2-for-1-voucher" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("2-for-1-voucher")		

		    	3.times do
		    		@ejemplo1.scan("VOUCHER")
		    	end
		    	3.times do
					@ejemplo1.scan("TSHIRT")
				end
				@ejemplo1.scan("MUG")
		    end

	        it "returns 77.5" do
	          expect(@ejemplo1.total).to eql(77.5)
	        end
	 	end

	 	context "Number 4: without offers" do

	    	before do		    	    	    
			
	    		@ejemplo2 = Checkout.new("")		

		    	3.times do
		    		@ejemplo2.scan("VOUCHER")
		    	end
		    	3.times do
					@ejemplo2.scan("TSHIRT")
				end
				@ejemplo2.scan("MUG")
		    end

	        it "returns 82.5" do
	          expect(@ejemplo2.total).to eql(82.5)
	        end
	 	end
	end


	describe "Examples 1, order: VOUCHER, TSHIRT, MUG" do

	    context "Apply two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt,2-for-1-voucher")	
		    	@ejemplo1.scan("VOUCHER")
		    	@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("MUG")
		    end

	        it "returns 32.5" do
	          expect(@ejemplo1.total).to eql(32.5)
	        end
	 	end	 	
	end

	describe "Examples 2, order: VOUCHER, TSHIRT, VOUCHER" do

	    context "Apply two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt,2-for-1-voucher")	
		    	@ejemplo1.scan("VOUCHER")
		    	@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("VOUCHER")
		    end

	        it "returns 25" do
	          expect(@ejemplo1.total).to eql(25.0)
	        end
	 	end	 	
	end

	describe "Examples 3, order: TSHIRT, TSHIRT, TSHIRT, VOUCHER, TSHIRT" do

	    context "Apply two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt,2-for-1-voucher")	
		    	@ejemplo1.scan("TSHIRT")
		    	@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("VOUCHER")
				@ejemplo1.scan("TSHIRT")
		    end

	        it "returns 81" do
	          expect(@ejemplo1.total).to eql(81.0)
	        end
	 	end	 	
	end

	describe "Examples 4, order: VOUCHER, TSHIRT, VOUCHER, VOUCHER, MUG, TSHIRT, TSHIRT" do

	    context "Apply two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("x-or-more-tshirt,2-for-1-voucher")	
		    	@ejemplo1.scan("VOUCHER")
		    	@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("VOUCHER")
				@ejemplo1.scan("VOUCHER")
				@ejemplo1.scan("MUG")
				@ejemplo1.scan("TSHIRT")
				@ejemplo1.scan("TSHIRT")
		    end

	        it "returns 74.5" do
	          expect(@ejemplo1.total).to eql(74.5)
	        end
	 	end	 	
	end
end

describe Offer1 do
	
	describe "Method of clash Offer1" do
		it "responds to '.value'" do
			expect(Offer1.new(0,4,3,20,19)).to respond_to(:value)			
		end
	end
end

describe Offer2 do

	describe "Method of clash Offer2" do
		it "responds to '.value'" do
			expect(Offer2.new(0,4,2,20)).to respond_to(:value)			
		end
	end
end
	