require 'pry'

class CashRegister

  attr_accessor :discount, :total, :title, :price, :quantity, :last_transaction, :item_list

  def initialize (discount = 0)
    @discount = discount
    @total = 0
    @item_list = []
  end

  def add_item (title, price, quantity = 1)
    @title = title
    @quantity = quantity
    @price = price*quantity.to_f
    @total += @price
    quantity.times do
      @item_list << @title
    end
    @last_transaction = self
  end

  def apply_discount
    if discount != 0
      @total = @total-(@total*discount/100)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item_list
  end

  def void_last_transaction
    @total = @total - @last_transaction.price
  end

end
