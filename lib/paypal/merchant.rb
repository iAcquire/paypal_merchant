module PayPal
  module Merchant
    class << self
      def new
        PayPal.configure_sdk
        PayPal::SDK::Merchant.new
      end
    end
  end
end