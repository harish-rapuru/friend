class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: User

  scope :accepted, -> { where(accepted: true) }
  scope :pending, ->  { where(accepted: false) }
end
