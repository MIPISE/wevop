# frozen_string_literal: true

require "ostruct"

module Wevop
  module Configuration
    extend Helpers

    def configuration
      @configuration ||= ::OpenStruct.new(http_timeout: 10000)
    end

    def configure
      yield(configuration)

      Wevop::Configuration.ensure_keys(configuration.to_h, %i[client_id api_key url_api authorization_url], %i[http_timeout])
    end
  end
end
