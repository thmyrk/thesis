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

class Movie < ActiveRecord::Base
  has_one :details, as: :product_info, dependent: :destroy

  validates :director, null: false
  validates :genre, null: false
  validates :age_requirements, null: false
end
