require "test_helper"

describe Post do
  let(:post) { posts(:one) }

  it "must be valid" do
    value(post).must_be :valid?
  end

  describe 'validations' do
    it 'is invalid without body' do
      post.body = nil
      refute(post.valid?)
    end

    it 'is invalid without user' do
      post.user = nil
      refute(post.valid?)
    end
  end

  describe 'Associations' do
    it 'belongs_to user' do
      assert_association Post, :belongs_to, :user
    end
  end
end
