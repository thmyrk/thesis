# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :topics
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :name, presence: true
end
