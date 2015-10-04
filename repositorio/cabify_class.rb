class Checkout  
  
  def initialize(rules)  
  	@items = []
  	@promotion_3_or_more_tshirt = false
    @promotion_2_for_1_voucher = false    

    (rules.split(",")).each do|r|
    	if r == "3-or-more-tshirt"
    		@promotion_3_or_more_tshirt = true
    	elsif r == "2-for-1-voucher"
    		@promotion_2_for_1_voucher = true
    	end
    end
  end  
  
  def scan(item)
  	@items << item
  end  
  
  def total  

  	mug_price = 7.50
	tshirt_price = 20.00
	voucher_price = 5.00

	tshirt_offer_price = 19.00

	number_mug = 0.00
	number_voucher = 0.00
	number_tshirt = 0.00

    @items.each do|a|
	
	  if a == "VOUCHER"
	  	number_voucher=number_voucher+1.00
	  elsif a == "TSHIRT"
	  	number_tshirt=number_tshirt+1.00
	  elsif a == "MUG"
	  	number_mug=number_mug+1.00
	  end

	end

	#puts "number_mug: #{number_mug}"
	#puts "number_tshirt: #{number_tshirt}"
	#puts "number_voucher: #{number_voucher}"

	#number mugs x his price
	price = number_mug*mug_price

	#number tshirt is equal o bigger 3, the price tshirt is chipper. Not 20, is 19
	if number_tshirt >= 3.00 && @promotion_3_or_more_tshirt == true
		tshirt_price=tshirt_offer_price
	end

	#to price sum number tshirt x his price
	price = price + number_tshirt*tshirt_price

	if @promotion_2_for_1_voucher == true
		#offer 2x1 voucher
		if number_voucher%2==0
			#if is equal 0, then a pair number, number/2
			number_voucher=number_voucher/2
			price = price + number_voucher*voucher_price
		elsif
			#to integer and this way round and sum the rest
			if number_voucher > 1
				price = price + ((number_voucher/2).to_i)*voucher_price + voucher_price*(number_voucher%2)
			else
				price = price + voucher_price
			end
		end
	else
		price = price + number_voucher*voucher_price
	end

	#algorythm new offer voucher, replace number 2 for new promotion (3) -> eje 3x1
	#if number_voucher%3==0
		#number_voucher=number_voucher/3
		#price = price + number_voucher*voucher_price
	#elsif
		#if number_voucher > 1
			#price = price + ((number_voucher/3).to_i)*voucher_price + voucher_price*(number_voucher%3)
		#else
			#price = price + voucher_price
		#end
	#end
	puts price 
  end  
end  


#if dont want offer, send "none" 
co = Checkout.new("3-or-more-tshirt,2-for-1-voucher")
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("VOUCHER")
co.scan("VOUCHER")
co.scan("MUG")
co.scan("TSHIRT")
co.scan("TSHIRT")
co.total
