# == Schema Information
#
# Table name: transactions
#
#  id         :integer          not null, primary key
#  completed  :boolean
#  sale_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Transaction < ActiveRecord::Base
  belongs_to :sale

  def complete_transaction
    self.update(completed: true)
  end
end
