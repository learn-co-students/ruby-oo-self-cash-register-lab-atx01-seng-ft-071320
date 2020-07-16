require 'pry'

class CashRegister
    
    attr_reader :discount, :items
    attr_accessor :total, :last_transation
    
    def initialize(discount = 0)
        total = 0
       @total = total
       @discount = discount
       @items = []

    end 

    def add_item(title, price, quantity = 1)
        @title = title
        @price = price
        @quantity = quantity 
        count = 0
        @last_transaction = price * quantity

        if @quantity > 0 
            while count < @quantity 
              @items << title 
              count += 1 
            end 
        else 
            @items << title 
        end 

        if @quantity > 0 
            @total = @total + (price * quantity)
        else
            @total = @total + price
        end  

    end 

    def apply_discount
        @total = (@total - (@total * (@discount / 100.00)))

        if @discount > 0 
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end 
    end 

    def void_last_transaction
       self.total = self.total - @last_transaction
    end 

end 

