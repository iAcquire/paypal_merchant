module PayPal
  module Merchant
    module MassPay

    protected

      # Send money to another PayPal account
      #
      def transfer(amount, email, options = {currency: "USD"})
        begin
          mass_pay_item = {
            ReceiverEmail: email,
            Amount: {currencyID: options[:currency],
              value: Money.new(amount).dollars},
            Note: options[:note],
            UniqueId: options[:unique_id]
          }
          send_mass_pay(mass_pay_item, options)
        rescue
          nil
        end
      end


      # Send money to multiple PayPal accounts
      #
      def bulk_transfer(recipients, options = {})
        begin
          mass_pay_item = recipients.map do |recipient|
            recipient.symbolize_keys!
            {ReceiverEmail: recipient[:email],
              Amount: {
                currencyID: options[:currency] || "USD",
                value: Money.new(recipient[:amount]).dollars
              }, Note: options[:note],
              UniqueId: options[:unique_id]}
          end
          send_mass_pay(mass_pay_item, options)
        rescue
          nil
        end
      end


      def send_mass_pay(mass_pay_item, options = {})
        merchant_api = PayPal::Merchant.new
        transfer_request = merchant_api.build_mass_pay({
          ReceiverType: "EmailAddress",
          EmailSubject: options[:subject],
          MassPayItem: [mass_pay_item].flatten
        })
        response = merchant_api.mass_pay(transfer_request)
      end

    end # MassPay
  end # Merchant
end # PayPal
