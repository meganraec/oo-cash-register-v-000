class CashRegister
  attr_accessor :total, :discount, :last_transaction

  def initialize( discount = 0 )
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total += (quantity * price)
    quantity.times {@items << item}
    self.last_transaction = (quantity * price)
  end

  def apply_discount
    if self.discount > 0
      @total -= (@total * (@discount.to_f/100.0))
      "After the discount, the total comes to $#{(@total.to_i)}."
    elsif self.discount = 0
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end
end


#
#   describe '#items' do
#     it 'returns an array containing all items that have been added' do
#       new_register = CashRegister.new
#       new_register.add_item("eggs", 1.99)
#       new_register.add_item("tomato", 1.76, 3)
#       expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
#     end
#   end
#
#   describe '#void_last_transaction' do
#     it 'subtracts the last transaction from the total' do
#       cash_register.add_item("tomato", 1.76)
#       expect{cash_register.void_last_transaction}.to change{cash_register.total}.from(1.76).to(0.0)
#     end
#   end
# end
