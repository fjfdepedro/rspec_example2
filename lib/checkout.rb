require 'yaml'
require 'nooffer'
require 'offer1'
require 'offer2'

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
	voucher_number_by_offer = prices_values["voucher_number_by_offer"]
	tshirt_offer_price = prices_values["tshirt_offer_price"]
	tshirt_number_offer_price = prices_values["tshirt_number_offer_price"]

	count_items_produt = @items.inject(Hash.new(0)) {|hash,item| hash[item] += 1; hash }

	number_mug = count_items_produt["MUG"]	
	number_tshirt = count_items_produt["TSHIRT"]
	number_voucher = count_items_produt["VOUCHER"]

	price = 0

	#calculate tshirt, no offer
	mug_nooffer = NoOffer.new(price,number_mug,mug_price)
	price = mug_nooffer.value();
	
	#calculate tshirt
	if @promotion_x_or_more_tshirt == true

		tshirt_offer1 = Offer1.new(price,number_tshirt,tshirt_number_offer_price,tshirt_price,tshirt_offer_price)
		price = tshirt_offer1.value();

	else
		tshirt_offer1 = NoOffer.new(price,number_tshirt,tshirt_price)
		price = tshirt_offer1.value();

	end

	#calculate voucher
	if @promotion_2_for_1_voucher == true
				
		voucher_offer2 = Offer2.new(price,number_voucher,voucher_number_by_offer,voucher_price)
		price = voucher_offer2.value();

	else
		voucher_offer2 = NoOffer.new(price,number_voucher,voucher_price)
		price = voucher_offer2.value();
	end

	return price 
  end  
end  

