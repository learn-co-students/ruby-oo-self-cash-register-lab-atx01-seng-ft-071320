class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_price
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount 
    @items = []
  end 
  
  def add_item(title, price, quantity = 1)
    quantity.times do 
      self.items.push(title)
    end 
    self.total += (price * quantity)
    self.last_price = (price * quantity).to_f 
  end 
  
  def apply_discount
    if self.discount == 0 
      "There is no discount to apply."
    else 
      self.total = self.total.to_f * (100-self.discount)/100
      "After the discount, the total comes to $#{self.total.to_i}."
    end 
  end 
  
  def items 
    @items 
  end 
  
  def void_last_transaction
    self.items.pop()
    if self.items.length == 0 
      self.total = 0.0
    end 
    self.total -= self.last_price
  end 
  

end 
