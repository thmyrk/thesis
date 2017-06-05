# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  message     :string(255)
#  author_id   :integer
#  receiver_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  belongs_to :author, class_name: :User, foreign_key: 'author_id'
  belongs_to :receiver, class_name: :User, foreign_key: 'receiver_id'

  validates :author, null: false
  validates :receiver, null: false
  validates :message, null: false
end
