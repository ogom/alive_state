require 'spec_helper'

describe AliveState do
  it ".applications" do
    expect(AliveState.applications.count).to eq(1)
  end

  it "application.name" do
    expect(AliveState.applications.first.name).to eq(:active_record)
  end

  it "application.alive?" do
    expect(AliveState.applications.first.alive?).to eq(true)
  end
end
