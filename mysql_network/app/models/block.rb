# == Schema Information
#
# Table name: blocks
#
#  id         :integer          not null, primary key
#  blocker_id :integer
#  blocked_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Block < ActiveRecord::Base
  belongs_to :blocker, class_name: :User, foreign_key: 'blocker_id'
  belongs_to :blocked_user, class_name: :User, foreign_key: 'blocked_id'

  validates :blocker, null: false
  validates :blocked_user, null: false
end
