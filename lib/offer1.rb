class Offer1
  
  def initialize(price=0,number_product,number_product_min,value_product,value_product_offer)
  		
		if number_product >= number_product_min
			value_product=value_product_offer
		end

		@price = number_product*value_product + price
  end    

  def value
  		return @price
  end
  
end  
