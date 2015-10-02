class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :body, presence: true
  validates :user_id, presence: true

  acts_as_likeable
end
