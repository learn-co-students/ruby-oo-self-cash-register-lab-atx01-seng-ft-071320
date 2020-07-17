require 'pry'
class CashRegister
 attr_accessor :discount, :total, :title, :price, :quantity, :item, :list_of_transaction
    
  
  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @cart = []
    @list_of_transaction = []
  end
  def total
    @total
  end
  def add_item(item, price, quantity= 1)
    @item = item
    @cart << item
    @price = price
    @quantity = quantity
    @total += (@price * quantity)
    @list_of_transaction << price
     until quantity == 1 do
       @list_of_transaction << price
        @cart << item
        quantity -=1
      end
   end
  def apply_discount
    if @discount > 0
    @discount = @discount/100.to_f
    @total = @total - (@total * (@discount))
    p "After the discount, the total comes to $#{@total.to_i}."
  else
    p "There is no discount to apply."
  end
  end
  def items
    @cart
  end
  def void_last_transaction
    until @list_of_transaction == [] do
    @total -= @list_of_transaction[0]
    @total  
  end
  end
end