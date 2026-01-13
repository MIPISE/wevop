# frozen_string_literal: true

module Wevop
  module V1
    module Verification
      extend Helpers

      class << self
        def verify(body: {}, request_id: ::SecureRandom.uuid)
          Wevop.post(generate_uri, body, request_id: request_id, include_timestamp: true)
        end
      end
    end
  end
end
