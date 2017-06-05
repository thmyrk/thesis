# == Schema Information
#
# Table name: movies
#
#  id               :integer          not null, primary key
#  director         :string(255)
#  genre            :string(255)
#  age_requirements :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :movie do
    director ""
    genre ""
    age_requirements ""
  end
end
