# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  completed  :boolean
#  sale_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :transaction do
    completed ""
  end
end
