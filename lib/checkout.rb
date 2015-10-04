class Checkout  
  
  def initialize(rules)  
  	@items = []
  	@promotion_3_or_more_tshirt = false
    @promotion_2_for_1_voucher = false    

    unless rules.nil? 
	    (rules.split(",")).each do|r|
	    	if r == "3-or-more-tshirt"
	    		@promotion_3_or_more_tshirt = true
	    	elsif r == "2-for-1-voucher"
	    		@promotion_2_for_1_voucher = true
	    	end
	    end
    end
  end  
  
  def scan(item)
  	@items << item
  end  
  
  def total  

  	mug_price = 7.5
	tshirt_price = 20
	voucher_price = 5

	tshirt_offer_price = 19

	number_mug = 0
	number_voucher = 0
	number_tshirt = 0

    @items.each do|a|
	
	  if a == "VOUCHER"
	  	number_voucher=number_voucher+1
	  elsif a == "TSHIRT"
	  	number_tshirt=number_tshirt+1
	  elsif a == "MUG"
	  	number_mug=number_mug+1
	  end

	end

	price = number_mug*mug_price

	if number_tshirt >= 3 && @promotion_3_or_more_tshirt == true
		tshirt_price=tshirt_offer_price
	end

	price = price + number_tshirt*tshirt_price

	if @promotion_2_for_1_voucher == true
		
		if number_voucher%2==0
			number_voucher=number_voucher/2
			price = price + number_voucher*voucher_price
		elsif
			if number_voucher > 1
				price = price + ((number_voucher/2).to_i)*voucher_price + voucher_price*(number_voucher%2)
			else
				price = price + voucher_price
			end
		end
	else
		price = price + number_voucher*voucher_price
	end

	return price 
  end  
end  

