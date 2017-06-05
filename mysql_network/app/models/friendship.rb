# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  person_id  :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  belongs_to :person, class_name: :User, foreign_key: 'person_id'
  belongs_to :friend, class_name: :User, foreign_key: 'friend_id'

  validates :person, null: false
  validates :friend, null: false
end
