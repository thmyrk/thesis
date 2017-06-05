# == Schema Information
#
# Table name: subscriptions
#
#  id          :integer          not null, primary key
#  follower_id :integer          not null
#  followed_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subscription < ActiveRecord::Base
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower, presence: true
  validates :followed, presence: true
end
