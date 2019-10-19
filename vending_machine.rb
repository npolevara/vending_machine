# frozen_string_literal: true

require_relative 'vending_bank'

class VendingMachine < VendingBank
  def initialize(bank)
    super
    @items = [{ name: 'Cola', quantity: 10, price: 1.60 },
              { name: 'Pepsi', quantity: 5, price: 1.65 },
              { name: 'Milk', quantity: 1, price: 1.85 },
              { name: 'Bread', quantity: 2, price: 1.25 },
              { name: 'Chocolate', quantity: 3, price: 2.25 }]
  end

  def price
    menu = @items.inject('') do |acc, item|
      acc + "#{item[:quantity]} #{item[:name]} for $#{item[:price]}\n"
    end
    menu += "\nVending machine has $#{@bank} for change\n"
    menu += "Your insert $#{@change.round 2}\n\n"
    puts menu
  end

  def insert_cash(cash = 0)
    @change += cash
    "You money $#{@change}"
  end

  def withdraw_change
    return 'There is no change' if @bank < @change

    cash = withdraw_transaction
    "Received $#{cash}"
  end

  def buy(product)
    item = find_item(product)
    return if fail_check_possibility(item)

    transaction(item)
    @change.zero? ? "Received #{item[:name]}" : "Received #{item[:name]}, you have $#{@change.round 2} left."
  end

  private

  def find_item(product)
    @items.find { |i| i[:name].downcase == product.downcase }
  end

  def fail_check_possibility(product)
    return refusing('There is no selected item') if product.nil?
    return refusing("Not enough money! Only $#{@change.round 2}.") if @change < product[:price]
    return refusing('This item is out of stock!') if product[:quantity].zero?

    false
  end

  def refusing(memo)
    puts memo
    true
  end
end
