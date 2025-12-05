# frozen_string_literal: true

require_relative "wevop/helpers"
require_relative "wevop/configuration.rb"
require_relative "wevop/authorization_token.rb"
require_relative "wevop/client.rb"

require_relative "wevop/v1/accounts/index.rb"
require_relative "wevop/v1/accounts/new.rb"

require_relative "wevop/version"

module Wevop
  class << self
    include Configuration
    include Client
  end
end
