require "test_helper"

describe Comment do
  let(:comment) { comments(:one) }

  it "must be valid" do
    value(comment).must_be :valid?
  end

  describe 'validations' do
    it 'is invalid without user' do
      comment.user = nil
      refute(comment.valid?)
    end

    it 'is invalid without post' do
      comment.post = nil
      refute(comment.valid?)
    end

    it 'is invalid without body' do
      comment.body = nil
      refute(comment.valid?)
    end
  end

  describe 'Associations' do
    it 'belongs_to user' do
      assert_association Comment, :belongs_to, :user
    end

    it 'belongs_to post' do
      assert_association Comment, :belongs_to, :post
    end
  end
end
