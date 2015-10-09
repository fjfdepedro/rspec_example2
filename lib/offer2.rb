class Offer2
  
  def initialize(price=0,number_product,number_offer,value_product)
  		
    		if number_product%number_offer==0
            number_product=number_product/number_offer
            @price = price + number_product*value_product
        else
            if number_product > 1
                @price = price + ((number_product/number_offer).to_i)*value_product + value_product*(number_product%number_offer)
            else
                @price = price + value_product
            end
        end
  end    

  def value
  		  return @price
  end
  
end  
