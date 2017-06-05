# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      not null
#  user_id    :integer          not null
#

FactoryGirl.define do
  factory :comment do
    
  end
end
