# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  quantity          :integer
#  price             :integer
#  product_info_id   :integer
#  product_info_type :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :product do
    name ""
    quantity ""
    price ""
  end
end
