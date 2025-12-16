# frozen_string_literal: true

require_relative "../test_helper"

describe "Wevop::AuthorizationToken" do
  it "returns an access token" do
    Wevop::AuthorizationToken::Manager.storage = nil
    assert Wevop::AuthorizationToken::Manager.get_token
    token = Wevop::AuthorizationToken::Manager.storage.get
    refute_nil token["access_token"]
    refute_nil token["timestamp"]
    assert_equal "verification account", token["scope"]
  end
end
