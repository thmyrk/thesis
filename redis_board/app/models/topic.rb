# == Schema Information
#
# Table name: topics
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  created_at  :datetime
#  updated_at  :datetime
#  category_id :integer          not null
#  user_id     :integer          not null
#

class Topic < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :posts

  validates :name, presence: true
  validates :category, presence: true
  validates :user, presence: true
end
