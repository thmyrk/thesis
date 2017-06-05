# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      not null
#  user_id    :integer          not null
#

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :likes

  validates :body, presence: true
end
