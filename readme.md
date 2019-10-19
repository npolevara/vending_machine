Simple irb console Vending machine:

```
load 'vending_machine'`

# Create new insstance with $10 for cash
m = VendingMachine.new 10

# show items price
m.price

# insert $5 to vending
m.insert_cash 5

# show your current balance
m.insert_cash

m.buy 'milk'
m.buy 'bread'
m.buy 'car'

# withdraw change if vending machine has
m.withdraw_change

# show vending machine total balance
m.show_balance
```