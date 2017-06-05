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

FactoryGirl.define do
  factory :hardware do
    warranty ""
    purpose ""
  end
end
