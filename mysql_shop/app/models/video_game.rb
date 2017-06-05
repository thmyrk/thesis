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

class VideoGame < ActiveRecord::Base
  has_one :details, as: :product_info, dependent: :destroy

  validates :genre, null: false
  validates :age_requirements, null: false
end
