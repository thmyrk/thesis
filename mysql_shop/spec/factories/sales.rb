# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  price      :integer
#  staff_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :sale do
    price ""
  end
end
