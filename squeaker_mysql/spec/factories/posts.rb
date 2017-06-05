# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)      not null
#  user_id    :integer          not null
#

FactoryGirl.define do
  factory :post do
    
  end
end
