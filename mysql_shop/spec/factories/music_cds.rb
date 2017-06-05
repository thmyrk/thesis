# == Schema Information
#
# Table name: music_cds
#
#  id         :integer          not null, primary key
#  artist     :string(255)
#  genre      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :music_cd do
    artist ""
    genre ""
  end
end
