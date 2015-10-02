class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable , :validatable

  acts_as_liker

  has_many :posts
  has_many :comments

  has_many :friendships
  has_many :friends, -> { Friendship.accepted }, :through => :friendships

  has_many :inverse_friendships, class_name: Friendship, foreign_key: 'friend_id'
  has_many :inverse_friends, -> { Friendship.accepted }, :through => :inverse_friendships, :source => :user

  has_many :users, -> { Friendship.accepted }, :through => :friendships
  
  def all_friends
    friends + inverse_friends
  end

  def all_friendships
    friendships + inverse_friendships
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def feed_posts
    friends_posts = []
    my_posts = posts
    all_friends.each do |friend|
      friend.posts.each do |post|
        friends_posts << post
      end
    end

    posts = (friends_posts + my_posts)
    return posts.sort_by(&:created_at).reverse!
  end
end
