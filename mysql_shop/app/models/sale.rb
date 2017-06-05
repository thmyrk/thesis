# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  price      :integer
#  staff_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ActiveRecord::Base
  belongs_to :staff
  has_one :payment, class_name: :Transaction

  has_many :products_sales
  has_many :products, through: :products_sales

  def finish_sale
    self.transaction do
      self.payment.complete_transaction
      self.products.each do |p|
        p.update(quantity: p.quantity - 1)
      end
    end
  end
end
