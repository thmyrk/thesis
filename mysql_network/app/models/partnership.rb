# == Schema Information
#
# Table name: partnerships
#
#  id               :integer          not null, primary key
#  person_id        :integer
#  partner_id       :integer
#  anniversary_date :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Partnership < ActiveRecord::Base
  belongs_to :person, class_name: :User, foreign_key: 'person_id'
  belongs_to :partner, class_name: :User, foreign_key: 'partner_id'

  validates :person, null: false
  validates :partner, null: false
  validates :anniversary_date, null: false
end
