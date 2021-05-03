require_relative 'client/connection'
require 'base64'

require_relative 'client/business'
require_relative 'client/employee'

module KeyPayAPI
  class Client
    include HTTParty
    include KeyPayAPI::Client::Connection
    include KeyPayAPI::Client::Employee
    include KeyPayAPI::Client::Business
    
    base_uri 'https://api.yourpayroll.com.au/api/v2'
    format :json

    def initialize(api_key = nil)
      api_key ||= ENV["KEYPAY_API_KEY"]
      raise KeyPayAPI::Error('Must pass an API key') if api_key.nil?
      enc_key = Base64.encode64(api_key + ':').gsub(/\n/,'')
      self.class.default_options.merge!(headers: {'Authorization': "Basic #{enc_key}", 'Content-Type': 'application/json'}, debug_output: STDOUT)
    end
  end
end
