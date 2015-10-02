require "test_helper"

describe Friendship do
  let(:friendship) { Friendship.new }

  it "must be valid" do
    value(friendship).must_be :valid?
  end
end
