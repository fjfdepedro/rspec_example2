require 'yaml'

class Offer  
  
  def initialize(number_offer,price,price_offer,number_start_offer)  
  	@items = []
  	@promotion_x_or_more_tshirt = false
    @promotion_2_for_1_voucher = false    

    unless rules.nil? 
	    (rules.split(",")).each do|r|
	    	if r == "x-or-more-tshirt"
	    		@promotion_x_or_more_tshirt = true
	    	elsif r == "2-for-1-voucher"
	    		@promotion_2_for_1_voucher = true
	    	end
	    end
    end
  end    
  
end  

