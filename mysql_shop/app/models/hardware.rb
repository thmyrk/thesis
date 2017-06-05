# == Schema Information
#
# Table name: hardwares
#
#  id         :integer          not null, primary key
#  warranty   :string(255)
#  purpose    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hardware < ActiveRecord::Base
  has_one :details, as: :product_info, dependent: :destroy

  validates :warranty, null: false
  validates :purpose, null: false
end
