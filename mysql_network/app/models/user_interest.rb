# == Schema Information
#
# Table name: user_interests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  interest_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :interest

  validates :user, null: false
  validates :interest, null: false
end
