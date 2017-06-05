# == Schema Information
#
# Table name: staffs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Staff < ActiveRecord::Base
  has_many :sales

  validates :name, null: false
  validates :position, null: false
end
