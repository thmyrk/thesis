# == Schema Information
#
# Table name: subscriptions
#
#  id          :integer          not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer          not null
#  category_id :integer          not null
#

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :user, presence: true
  validates :category, presence: true
end
