require "pry"
class CashRegister
    attr_accessor :total, :discount, :items, :items_w_price
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @items_w_price = {}
    end 
    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times do
            items.push(title)
            items_w_price[title] = price * quantity
        end
    end 
    def apply_discount
        if discount!=0
            self.total *= ((100.0-discount.to_f)/100)
            p "After the discount, the total comes to $#{self.total.to_i}."
        else
            p "There is no discount to apply."
        end 
    end
    def void_last_transaction
        void_item = items.last
        self.total -= items_w_price[void_item]
    end

end 
