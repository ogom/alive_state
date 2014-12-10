require 'spec_helper'

describe "AliveState::VERSION" do
  describe "reference" do
    it "returns #{AliveState::VERSION} version" do
      expect(AliveState::VERSION).to eq(AliveState::VERSION)
    end
  end
end
