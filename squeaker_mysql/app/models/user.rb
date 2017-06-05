# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :posts
  has_many :subscriptions, foreign_key: "follower_id"
  has_many :followers, through: :subscriptions, as: :followed

  validates :user_name, presence: true

  def self.like_every_post_of_user(liked_user, user_who_likes)
    liked_user.posts.each do |post|
      Like.create(post: post, user: user_who_likes)
    end
  end

  def self.get_new_posts_from_subscriptions(user)
    posts = []
    user.subscriptions.each do |s|
      posts << s.followed.posts.where(created_at: 1.day.ago..Time.now)
    end
    posts
  end
end
