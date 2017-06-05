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

FactoryGirl.define do
  factory :post do
    message "MyString"
  end
end
