module PayPal
  module Merchant
    module DoDirectPayment

    protected

      # Charge a credit card
      #
      def charge(amount, card, options = {currency: "USD"})
        card.symbolize_keys!
        begin
          do_direct_payment_item = {
            DoDirectPaymentRequestDetails: {
              PaymentAction: options[:action] || "Sale",
              PaymentDetails: {
                OrderTotal: {
                  value: Money.new(amount).dollars,
                  currencyID: options[:currency] || "USD"
                },
                NotifyURL: options[:notify_url],
                ShipToAddress: {
                  Name: options[:name],
                  Street1: options[:address],
                  CityName: options[:city],
                  StateOrProvince: options[:state],
                  Country: options[:country],
                  PostalCode: options[:postal_code]
                }
              },
              CreditCard: {
                CreditCardType: card[:type],
                CreditCardNumber: card[:number],
                ExpMonth: card[:exp_month],
                ExpYear: card[:exp_year],
                CVV2: card[:cvc_code]
              }
            }
          }
          send_do_direct_payment(do_direct_payment_item)
        rescue
          nil
        end
      end


      # Make API call & get response
      #
      def send_do_direct_payment(do_direct_payment_item, options = {})
        merchant_api = PayPal::Merchant.new
        charge_request = merchant_api.build_do_direct_payment(do_direct_payment_item)
        response = merchant_api.do_direct_payment(charge_request)
      end


    end # DoDirectPayment
  end # Merchant
end # PayPal