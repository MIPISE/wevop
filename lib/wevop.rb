# frozen_string_literal: true

require "securerandom" unless Object.const_defined?("SecureRandom")
require "time"
require_relative "wevop/helpers"
require_relative "wevop/configuration"
require_relative "wevop/authorization_token"
require_relative "wevop/client"

require_relative "wevop/v1/accounts/index"
require_relative "wevop/v1/accounts/new"
require_relative "wevop/v1/verification/new"

require_relative "wevop/version"

module Wevop
  class << self
    include Configuration
    include Client
  end
end
