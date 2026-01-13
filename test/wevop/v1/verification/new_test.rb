# frozen_string_literal: true

require_relative "../../../test_helper"

describe "Wevop::V1::Verification#create" do
  it "controls IBAN are identical" do
    iban_params =
      {
        "party": {
          "name": "Dupont Jean"
        },
        "partyAccount": {
          "iban": "BE12345678901234"
        },
        "partyAgent": {
          "financialInstitutionId": {
            "bicfi": "PTSBFRLLXXX"
          }
        },
        "requestingAgent": {
          "financialInstitutionId": {
            "bicfi": "PTSBFRLLXXX"
          }
        }
      }
    res = Wevop::V1::Verification.verify(body: iban_params)
    assert_equal "200", res.code
  end

  it "returns an error if no body is passed" do
    res = Wevop::V1::Verification.verify(body: {})
    assert_equal "400", res.code
    res = Wevop::V1::Verification.verify(body: nil)
    assert_equal "400", res.code
  end
end
