require "pry" 

class CashRegister
    
    attr_accessor :total, :discount, :item, :transaction
    
    def initialize(discount=0)
        @total=0
        @discount=discount
        @cart=[]
    end

    def add_item(item, price, quantity=1)
        @item=item
        @price=price
        @quantity=quantity
        @total += (@price*quantity)
        @cart << @item
        @transaction=@price
        while quantity>1
            @cart << @item
            quantity-=1
            @transaction=@price+@price
        end
    end

    def apply_discount
        if @discount>0
            @total=@total-(@total*(@discount/100.to_f))
            p "After the discount, the total comes to $#{@total.to_i}."
        else
            p "There is no discount to apply."
        end
    end
    
    def items
        @cart
    end

    def void_last_transaction
        @total=@total-@transaction
    end

end