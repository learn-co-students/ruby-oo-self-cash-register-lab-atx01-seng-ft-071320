
require 'pry'

class CashRegister
 

    
    attr_accessor :items, :discount, :total, :price, :last_transaction
   
   

    def initialize(discount=0)
      @items = []
      @total = 0
      @discount = discount

    end
   
    def add_item(item, price, quantity=1)
        
        @last_transaction = price * quantity
        @total = total + price * quantity
        counter = 1
        while counter <= quantity 
            @items << item
        counter += 1
        end
        
    end

    
def apply_discount
    if discount > 0
        @total = total - (total * discount.to_f/100)   
        return "After the discount, the total comes to $#{total.to_int}."
    else 
        return "There is no discount to apply."
    end
    
end

def void_last_transaction

        @total = total - @last_transaction 
    end      
end