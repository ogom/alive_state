require 'spec_helper'

describe AliveState::Info do
  describe "version" do
    it "returns info version" do
      expect(AliveState::Info.version).not_to be_nil
    end
  end

  describe "reversion" do
    it "returns info reversion" do
      expect(AliveState::Info.reversion).not_to be_nil
    end
  end
end
