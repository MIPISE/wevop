# frozen_string_literal: true

require_relative "../test_helper"

describe "Weop::VERSION" do
  it "render SDK version and not nil" do
    refute_nil ::Wevop::VERSION
  end
end
