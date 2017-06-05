# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      not null
#  user_id    :integer          not null
#

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, presence: true
end
