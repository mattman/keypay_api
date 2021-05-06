# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'httparty'

require_relative "keypay_api/version"
require_relative "keypay_api/resource"
require_relative "keypay_api/resource_collection"
require_relative "keypay_api/client"

# Access to the Australian KeyPay API
# @version 2.0
module KeyPayAPI
  class Error < StandardError; end
end
