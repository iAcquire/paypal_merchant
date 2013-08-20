module PayPal
  class Transfer
    include PayPal::Merchant::MassPay

    attr_accessor :response, :amount, :email

    class << self
      def create(params = {})
        new(params)
      end
    end


    def initialize(params = {})
      @amount, @email = params[:amount], params[:email]
      if @amount && @email
        @response = self.transfer(@amount, @email, params)
      else
        raise "You must provide an amount and a recipient email address."
      end
    end


    def success?
      @response && @response.try(:success?)
    end

  end
end