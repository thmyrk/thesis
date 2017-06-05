# == Schema Information
#
# Table name: video_games
#
#  id               :integer          not null, primary key
#  genre            :string(255)
#  age_requirements :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :video_game do
    genre ""
    age_requirements ""
  end
end
