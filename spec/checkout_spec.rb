# spec/checkout_spec.rb
require "checkout"

describe Checkout do

	describe "Method of clash Checkout" do
		it "responds to '.scan'" do
				  expect(Checkout.new("3-or-more-tshirt,2-for-1-voucher")).to respond_to(:scan)
		end
		it "responds to '.total'" do
				  expect(Checkout.new("3-or-more-tshirt,2-for-1-voucher")).to respond_to(:total)
		end
	end

	describe "Examples" do

	    context "Number 1: with two offers" do

	    	before do		    	    	    
			
	    		@ejemplo1 = Checkout.new("3-or-more-tshirt,2-for-1-voucher")		

		    	3.times do
		    		@ejemplo1.scan("VOUCHER")
		    	end
		    	3.times do
					@ejemplo1.scan("TSHIRT")
				end
				@ejemplo1.scan("MUG")
		    end

		    context "results" do
		        it "returns 74.5" do
		          expect(@ejemplo1.total).to eql(74.5)
		        end
		    end

	 	end

	 	context "Number 2: without offers" do

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

		    context "results" do
		        it "returns 82.5" do
		          expect(@ejemplo2.total).to eql(82.5)
		        end
		    end

	 	end
	end
end	

#if dont want offer, send "none" 
=begin
co = Checkout.new("3-or-more-tshirt,2-for-1-voucher")
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("MUG")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.total

it "responds to '.scan'" do
  expect(subject).to respond_to(:scan)
end

it "responds to '.total'" do
  expect(subject).to respond_to(:total)
end

subject do
  Checkout.new("3-or-more-tshirt,2-for-1-voucher")        
end



=end
	