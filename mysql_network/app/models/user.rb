# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_profile_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  belongs_to :user_profile
  has_many :written_posts, foreign_key: 'author_id', class_name: :Post
  has_many :received_posts, foreign_key: 'receiver_id', class_name: :Post
  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :friendships, foreign_key: 'person_id'
  has_many :friends, through: :friendships
  has_many :blocks, foreign_key: 'blocker_id'
  has_many :blocked_users, through: :blocks
  has_many :partnerships, foreign_key: 'person_id'
  has_many :partners, through: :partnerships
  has_many :kinships, foreign_key: 'person_id'
  has_many :relatives, through: :kinships

  validates :user_profile, null: false

  def distant_friends
    User.joins("INNER JOIN friendships f1 ON users.id = f1.friend_id").
      joins("INNER JOIN friendships f2 ON f1.person_id = f2.friend_id").
      where('f2.person_id = ?', self.id).distinct
  end

  def distant_friends2
    User.joins("INNER JOIN friendships f1 ON users.id = f1.friend_id").
      joins("INNER JOIN friendships f2 ON f1.person_id = f2.friend_id").
      joins("INNER JOIN friendships f3 ON f2.person_id = f3.friend_id").
      where('f3.person_id = ?', self.id).distinct
  end

  def distant_friends3
    User.joins("INNER JOIN friendships f1 ON users.id = f1.friend_id").
      joins("INNER JOIN friendships f2 ON f1.person_id = f2.friend_id").
      joins("INNER JOIN friendships f3 ON f2.person_id = f3.friend_id").
      joins("INNER JOIN friendships f4 ON f3.person_id = f4.friend_id").
      where('f4.person_id = ?', self.id).distinct
  end

  def get_friends_with_interest(name)
    User.joins("INNER JOIN friendships ON users.id = friendships.friend_id").
      joins("INNER JOIN kinships ON kinships.person_id = friendships.friend_id").
      joins("INNER JOIN user_interests ON user_interests.user_id = kinships.relative_id").
      joins("INNER JOIN interests ON user_interests.interest_id = interests.id").
      where("interests.name LIKE '%#{name}%'").
      where("friendships.person_id = ?", self.id)
  end

  def get_anniversary_date
    Partnership.select(:anniversary_date, :partner_id).
      joins('INNER JOIN users ON person_id = users.id').
      joins('INNER JOIN friendships ON users.id = friendships.friend_id').
      where('friendships.person_id = ?', self.id).
      joins('INNER JOIN posts ON users.id = posts.receiver_id').
      where("posts.message LIKE '%of%'").distinct.map(&:anniversary_date)
  end

end
