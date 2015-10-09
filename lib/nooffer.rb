class NoOffer  
  
  def initialize(price=0,number_product,value_product)
  		@price = number_product*value_product + price
  end    

  def value
  		return @price
  end
  
end  
