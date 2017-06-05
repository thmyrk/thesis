# == Schema Information
#
# Table name: products_sales
#
#  id         :integer          not null, primary key
#  product_id :integer
#  sale_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductsSale < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale
end
