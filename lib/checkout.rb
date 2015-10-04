require 'yaml'

class Checkout  
  
  def initialize(rules)  
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
  
  def scan(item)
  	@items << item
  end  
  
  def total  
  	prices_values = YAML.load_file('prices.yml')

  	mug_price =  prices_values["mug_price"]
	tshirt_price = prices_values["tshirt_price"]
	voucher_price = prices_values["voucher_price"]
	tshirt_offer_price = prices_values["tshirt_offer_price"]
	tshirt_number_offer_price = prices_values["tshirt_number_offer_price"]

	count_items_produt = @items.inject(Hash.new(0)) {|hash,item| hash[item] += 1; hash }

	number_mug = count_items_produt["MUG"]
	number_voucher = count_items_produt["VOUCHER"]
	number_tshirt = count_items_produt["TSHIRT"]

	#calculate tshirt
	price = number_mug*mug_price

	#calculate tshirt
	if number_tshirt >= tshirt_number_offer_price && @promotion_x_or_more_tshirt == true
		tshirt_price=tshirt_offer_price
	end

	price = price + number_tshirt*tshirt_price

	#calculate voucher
	if @promotion_2_for_1_voucher == true
		
		if number_voucher%2==0
			number_voucher=number_voucher/2
			price = price + number_voucher*voucher_price
		else
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

