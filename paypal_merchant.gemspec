Gem::Specification.new do |s|
  s.name        = 'paypal_merchant'
  s.version     = '0.1.2'
  s.summary     = "Wrapper for PayPal's merchant-sdk-ruby library"
  s.description = "Wrapper for PayPal's merchant-sdk-ruby library"
  s.homepage    = "https://github.com/zohlgren/paypal_merchant"
  s.authors     = ["Zach Ohlgren"]
  s.email       = 'zach@ohlgren.me'

  s.add_dependency('paypal-sdk-merchant', '~> 1.103')
  s.add_dependency('money', '~> 5.1')

  s.files = `git ls-files`.split("\n")
  s.require_path = "lib"
end