module PayPal
  module Merchant

    def self.new
      PayPal.configure_sdk
      PayPal::SDK::Merchant.new
    end

  end
end