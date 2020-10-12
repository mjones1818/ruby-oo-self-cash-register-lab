require 'pry'

class CashRegister
  attr_accessor :total, :items, :last_item
  attr_reader :discount
  def initialize (employee_discount=0)
    @total = 0
    @discount = employee_discount
    self.items = []
  end

  def add_item (title, price, quantity = 1)

    quantity.times {@items << title}
    #binding.pry
    @last_item = [title, price, quantity]
    @total += price * quantity
    @items
  end

  def apply_discount
    #binding.pry
    if @discount == 0
      return "There is no discount to apply."
    end
    @total = @total * ((100.0 - @discount)/100.0)
    "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @last_item[1] * @last_item[2]
  end
end
