# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#

FactoryGirl.define do
  factory :like do
    
  end
end
