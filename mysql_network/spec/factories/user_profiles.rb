# == Schema Information
#
# Table name: user_profiles
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  date_of_birth :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :user_profile do
    
  end
end
