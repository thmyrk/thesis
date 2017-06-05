class User
  include Cequel::Record

  key :user_name, :text

  has_many :posts
  has_many :subscriptions

  def self.like_every_post_of_user(user1, user2)
    Post[user1].each do |post|
      Like.create(post: post, user_name: user2)
    end
    true
  end

  def self.get_new_posts_from_subscriptions(user_name)
    posts = []
    Subscription[user_name].each do |subscription|
      posts << Post[subscription.followed_name].from(1.day.ago)
    end
    posts
  end
end
