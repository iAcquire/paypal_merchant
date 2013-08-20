module PayPal
  class Charge
    include PayPal::Merchant::DoDirectPayment

    attr_accessor :response


    class << self
      def create(params = {})
        new(params)
      end
    end


    def initialize(params = {})
      amount, card = params[:amount], params[:card]
      if amount && card
        @response = charge(amount, card, params)
      else
        raise "You must provide an amount and credit card"
      end
    end


    def success?
      @response && @response.try(:success?)
    end

  end
end