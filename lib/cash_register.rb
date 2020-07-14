
class CashRegister 
  attr_accessor :total, :items, :discount, :last
  
  def initialize(discount=0)
    @total=0 
    @items=[]
    @discount= discount
  end 
  
  
  def add_item(title, price, quantity=1)
    i=0
    while (i<quantity) do
      @items.push(title)
      i+=1
    end 
    self.last=price*quantity
    self.total += price*quantity
  end 
  
  def apply_discount 
    if @discount==0 
      "There is no discount to apply."
    else 
      self.total= @total-@total*@discount/100
      "After the discount, the total comes to $#{@total}."
    end 
  end 
  
  def items 
    @items 
  end 
    
  def void_last_transaction
    self.total-=self.last
  end 
end 