# frozen_string_literal: true

module Wevop
  module V1
    module Accounts
      extend Helpers

      class << self
        def synchronize(body: [], request_id: SecureRandom.uuid)
          Wevop.post(generate_uri, body, request_id: request_id)
        end
      end
    end
  end
end
