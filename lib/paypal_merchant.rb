require 'paypal-sdk-merchant'
require 'money'
require 'paypal/merchant'
require 'paypal/merchant/do_direct_payment'
require 'paypal/merchant/mass_pay'
require 'paypal/merchant/reporting'
require 'paypal/account'
require 'paypal/charge'
require 'paypal/transfer'

module PayPal

  @mode = "sandbox"

  @logger = PayPal::SDK::Core::Logging.logger

  class << self
    attr_accessor :mode, :logger, :client_id, :client_secret, :username, :password, :signature
  end

  def self.configure(options = {})
    @mode = options[:mode] || "sandbox"
    @client_id = options[:client_id]
    @client_secret = options[:client_secret]
    @username = options[:username]
    @password = options[:password]
    @signature = options[:signature]
    @logger = options[:logger]
    configure_sdk
  end

private

  def self.configure_sdk
    PayPal::SDK::Core::Config.logger = @logger
    PayPal::SDK.configure(
      mode: @mode,
      client_id: @client_id,
      client_secret: @client_secret,
      username: @username,
      password: @password,
      signature: @signature
    )
  end

end