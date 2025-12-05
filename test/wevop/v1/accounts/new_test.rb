# frozen_string_literal: true

require_relative "../../../test_helper"

describe "Wevop::V1::Accounts#create" do
  it "synchronizes accounts" do
    accounts_params =
      [
        {
          "iban" => "FR7612345678901234567890123",
          "name" => "Lily Doe",
          "holderType" => "NATURAL",
          "status" => "ACTIVE",
          "bic" => "PTSBFRLLXXX"
        }
      ]
    res = Wevop::V1::Accounts.synchronize(body: accounts_params)
    assert_equal "200", res.code
  end

  it "returns an error if no items passed" do
    res = Wevop::V1::Accounts.synchronize(body: [])
    assert_equal "400", res.code
    res = Wevop::V1::Accounts.synchronize(body: nil)
    assert_equal "400", res.code
  end
end
