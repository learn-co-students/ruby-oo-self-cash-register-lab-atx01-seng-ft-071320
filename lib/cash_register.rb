require 'pry'
class CashRegister
    attr_accessor :discount, :total, :quantity, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        counter = 0
        
        @total += price * quantity
        while counter < quantity do 
            @items << title
            counter += 1
        end

        @last = price * quantity
    end

    def apply_discount
        @discount = @total * @discount / 100
        @total -= @discount
        if @discount == 0
            p "There is no discount to apply."
        else
            p "After the discount, the total comes to $#{@total}."
        end
    end

    def items
        @items 
    end

    def void_last_transaction
        @total = @total - @last
    end

end

