# frozen_string_literal: true

class VendingBank

  def initialize(bank)
    @profit = 0.0
    @change = 0.0
    @bank = bank.to_f
  end

  def show_balance
    "tota balance: $#{@bank + @profit}."
  end

  private

  def transaction(item)
    @profit += item[:price]
    item[:quantity] -= 1
    @change -= item[:price]
  end

  def withdraw_transaction
    @bank -= @change
    @profit += @change
    cash = @change
    @change = 0.0
    cash.round 2
  end
end
