module PayPal
  module Merchant
    module Reporting


      def self.included(base)
        base.extend ClassMethods
      end


      module ClassMethods
        # Get the balance of your PayPal account
        #
        # Returns an the balance in cents for the primary currency
        # holding of the account).
        #
        def balance
          merchant_api = PayPal::Merchant.new
          balance_request = merchant_api.build_get_balance
          response = merchant_api.get_balance(balance_request)
          if response.success?
            Money.parse(response.balance.value).cents
          else
            nil
          end
        end

      end # ClassMethods

    end # Reporting
  end # Merchant
end # PayPal