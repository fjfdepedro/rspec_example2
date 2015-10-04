# spec/checkout_spec.rb
require "checkout"

describe Checkout do

	describe ".total" do

	    context "results a example" do

		    before do

		    	Checkout.new("3-or-more-tshirt,2-for-1-voucher")        
			    
		    	3.times do
		    		Checkout.scan("VOUCHER")
		    	end
		    	3.times do
					Checkout.scan("TSHIRT")
				end
				Checkout.scan("MUG")
		    end

		    context "results" do
		        it "returns 75" do
		          expect(Checkout.total).to eql(75)
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

it { is_expected.to respond_to(:scan) }
it { is_expected.to respond_to(:total) }

=end
	