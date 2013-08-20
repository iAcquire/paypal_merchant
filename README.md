# paypal_merchant 

A wrapper for PayPal's merchant-sdk-ruby library


### Installation

    gem install paypal_merchant


### Configuration
  
    require 'paypal_merchant'

Then:

    PayPal.mode = "live" # default is "sandbox"
    PayPal.username = PAYPAL_USERNAME
    PayPal.password = PAYPAL_PASSWORD
    PayPal.signature = PAYPAL_SIGNATURE

Or alternatively:

    PayPal.configure({
      mode: "live", 
      username: PAYPAL_USERNAME, 
      password: PAYPAL_PASSWORD,
      signature: PAYPAL_SIGNATURE
    })


### Examples

##### Checking your account balance
    PayPal::Account.balance # => 4831023

##### Charging a credit card for $10
    charge = PayPal::Charge.create(amount: 1000, card: {number: 4222222222222, exp_month: 12, exp_year: 2018})
    charge.success? # => true

##### Transfer $20 to another PayPal account
    transfer = PayPal::Transfer.create(amount: 2000, email: "paypal-email@example.com")
    transfer.success? # => true

