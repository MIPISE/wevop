# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "dotenv/load"
require "wevop"
require "minitest/autorun"
require "minitest/reporters"

Wevop.configure do |conf|
  conf.url_api = ENV["WEVOP_URL_API"]
  conf.api_key = ENV["WEVOP_API_KEY"]
  conf.client_id = ENV["WEVOP_CLIENT_ID"]
  conf.authorization_url = ENV["WEVOP_AUTHORIZATION_URL"]
end

Minitest::Reporters.use!
