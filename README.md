= Wrapper for PayPal's merchant-sdk-ruby library


Configuration
-------------

  PayPal.configure {
    mode: "sandbox", # "live" or "sandbox"
    username: <PAYPAL-USERNAME>, 
    password: <PAYPAL-PASSWORD>,
    signature: <PAYPAL-SIGNATURE>
  }
  

Examples
--------

  # Checking your account balance
  PayPal::Account.balance # => 4831023
  
  # Charging a credit card for $10
  charge = PayPal::Charge.create(amount: 1000, card: {number: 4222222222222, exp_month: 12, exp_year: 2018})
  charge.success? # => true

  # Transfer $20 to another PayPal account
  transfer = PayPal::Transfer.create(amount: 2000, email: "paypal-email@example.com")
  transfer.success? # => true

