# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  has_many :posts
  has_many :subscriptions
  has_many :categories, through: :subscriptions

  validates :name, presence: true

  def get_latest_posts
    time_range = (Time.now - 2.days)..Time.now
    Post.joins(:topic).where(topic_id: Topic.joins(:category).where(category_id: self.categories)).where(created_at: time_range)
  end
end
