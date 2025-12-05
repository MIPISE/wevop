# frozen_string_literal: true

require_relative "../../../test_helper"

describe "Wevop::V1::Accounts#get_list" do
  it "returns a list of accounts" do
    res = Wevop::V1::Accounts.get_list
    assert_equal "200", res.code
    body = JSON.parse(res.body)
    assert body.has_key?("_embedded")
    first_acc = body.dig("_embedded", "accounts").first
    assert first_acc["id"]
    assert first_acc["iban"]
    assert first_acc["name"]
    assert first_acc["holderType"]
    assert first_acc["bic"]
    assert first_acc["status"]
  end
end
