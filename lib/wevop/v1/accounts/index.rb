# frozen_string_literal: true

module Wevop
  module V1
    module Accounts
      extend Helpers

      class << self
        def get_list(uri_opt: {}, request_id: SecureRandom.uuid)
          permitted_uri_opt = %i[
            page
            size
            sort
            dir
            search
          ]
          ensure_keys(uri_opt, [], permitted_uri_opt)
          Wevop.get(generate_uri(uri_opt), request_id: request_id)
        end
      end
    end
  end
end
