# == Schema Information
#
# Table name: kinships
#
#  id                :integer          not null, primary key
#  person_id         :integer
#  relative_id       :integer
#  relationship_name :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Kinship < ActiveRecord::Base
  belongs_to :person, class_name: :User, foreign_key: 'person_id'
  belongs_to :relative, class_name: :User, foreign_key: 'relative_id'

  validates :person, null: false
  validates :relative, null: false
  validates :relationship_name, null: false
end
