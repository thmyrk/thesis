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

class MusicCd < ActiveRecord::Base
  has_one :details, as: :product_info, dependent: :destroy

  validates :artist, null: false
  validates :genre, null: false
end
