# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  topic_id   :integer          not null
#  user_id    :integer          not null
#  title      :string(255)      not null
#  body       :string(255)      not null
#

class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user

  validates :topic, presence: true
  validates :user, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
