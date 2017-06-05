# == Schema Information
#
# Table name: interests
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Interest < ActiveRecord::Base
  has_many :user_interests
  has_many :users, through: :user_interests

  validates :name, null: false
  validates :desc, null: false
end
