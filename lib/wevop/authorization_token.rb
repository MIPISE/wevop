# frozen_string_literal

module Wevop
  module AuthorizationToken
    # Wevop::AuthorizationToken::Manager handles authorization token retrieval.
    class Manager
      class << self
        def storage
          @@storage ||= StaticStorage.new
        end

        def storage=(storage)
          @@storage = storage
        end

        # Wevop::AuthorizationToken::Manager.get_token
        def get_token
          token = storage.get
          unless token && (token_timestamp = token["timestamp"]) && token_timestamp > Time.now
            reset_token
          end
          storage.get
        end

        def reset_token
          token = parsed_token_response
          token["timestamp"] = Time.now + (token["expires_in"]&.to_i - 10)
          storage.store token
        end

        def parsed_token_response
          begin
            JSON.parse(authorization_token_response&.body)
          rescue JSON::ParserError
            nil
          end
        end

        def authorization_token_response
          uri = URI.parse("#{configuration.authorization_url}/oauth2/token")
          Net::HTTP.start(uri.host, uri.port, use_ssl: true, :read_timeout => configuration.http_timeout, ssl_version: :TLSv1_2) do |http|
            req = Net::HTTP::Post.new(uri.request_uri)
            req.body = "grant_type=client_credentials&client_id=#{configuration.client_id}&client_secret=#{configuration.api_key}&scope=verification account"
            req.add_field('Content-Type', 'application/x-www-form-urlencoded')
            http.request(req)
          end
        end

        def configuration
          Wevop.configuration
        end
      end

      class StaticStorage
        def get
          @@token ||= nil
        end

        def store(token)
          @@token = token
        end
      end
    end
  end
end
