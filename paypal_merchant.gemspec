Gem::Specification.new do |gem|
  gem.name        = 'paypal_merchant'
  gem.version     = '0.1.7'
  gem.summary     = "Wrapper for PayPal's merchant-sdk-ruby library"
  gem.description = "Wrapper for PayPal's merchant-sdk-ruby library"
  gem.homepage    = "https://github.com/zohlgren/paypal_merchant"
  gem.authors     = ["Zach Ohlgren"]
  gem.email       = 'zach@ohlgren.me'
  gem.license     = 'MIT'

  gem.add_dependency('paypal-sdk-merchant', '~> 1.103')
  gem.add_dependency('money', '~> 6.17.0')
  gem.add_dependency('monetize', '~> 1.11.0')

  gem.files = `git ls-files`.split("\n")
  gem.require_path = "lib"
end
