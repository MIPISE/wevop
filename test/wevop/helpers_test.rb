# frozen_string_literal: true

require_relative "../test_helper"

describe "Helpers" do
  describe "#generate_uri" do
    let(:wevop_accounts_class) { Wevop::V1::Accounts }
    let(:wevop_verification_class) { Wevop::V1::Verification }

    it "render URI based on Class name" do
      assert_equal "v1/accounts", wevop_accounts_class.generate_uri
      assert_equal "v1/verification", wevop_verification_class.generate_uri
    end

    it "render URI based on Class name with 1 option" do
      assert_equal "v1/accounts?test=test", wevop_accounts_class.generate_uri({test: "test"})
      assert_equal "v1/verification?test=test", wevop_verification_class.generate_uri({test: "test"})
    end

    it "render URI based on Class name with 2 options" do
      assert_equal "v1/accounts?test=test&test2=test2", wevop_accounts_class.generate_uri({test: "test", test2: "test2"})
      assert_equal "v1/verification?test=test&test2=test2", wevop_verification_class.generate_uri({test: "test", test2: "test2"})
    end

    it "render URI based on Class name with post option and options" do
      assert_equal "v1/accounts/disable?test=test&test2=test2", wevop_accounts_class.generate_uri({test: "test", test2: "test2"}, "disable")
    end

    it "render URI based on Class name with post option" do
      assert_equal "v1/accounts/disable", wevop_accounts_class.generate_uri({}, "disable")
    end
  end

  describe "#ensure_keys" do
    let(:required_keys) { %i[test test2 test3] }
    let(:optional_keys) { %i[test4] }

    before do
      @hash = {test: "test", test2: "test2", test3: "test3", test4: "test4"}
    end

    it "render hash required keys present" do
      assert_equal @hash, Wevop::V1::Accounts.ensure_keys(@hash, required_keys, optional_keys)
    end

    it "render hash required keys present and optl missing" do
      assert_equal @hash, Wevop::V1::Accounts.ensure_keys(@hash, required_keys, optional_keys)
    end

    it "raise error when missing required key" do
      @hash.delete(:test3)
      assert_raises(ArgumentError) { Wevop::V1::Accounts.ensure_keys(@hash, required_keys, optional_keys) }
    end

    it "raise error when key not recognized" do
      @hash[:test5] = "test5"
      assert_raises(ArgumentError) { Wevop::V1::Accounts.ensure_keys(@hash, required_keys, optional_keys) }
    end
  end
end
