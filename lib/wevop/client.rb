# frozen_string_literal: true

require "net/http"
require "json"

module Wevop
  module Client
    def get(uri, request_id: SecureRandom.uuid)
      request(uri, method: "GET", request_id: request_id)
    end

    def post(uri, body, request_id: SecureRandom.uuid)
      request(uri, body: body, method: "POST", request_id: request_id)
    end

    private

    attr_accessor :token

    def request(path, body: {}, method: "GET", headers: nil, request_id: SecureRandom.uuid)
      uri = URI.parse("#{Wevop.configuration.url_api}/#{path}")
      headers ||= request_headers.merge("X-Request-ID" => request_id)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.send_request(method, uri.to_s, body.to_json, headers)
    end

    def request_headers
      auth_token = ::Wevop::AuthorizationToken::Manager.get_token
      {
        "Authorization" => "#{auth_token["token_type"]} #{auth_token["access_token"]}",
        "Content-Type" => "application/json"
      }
    end
  end
end
