class Transaction
  include Mongoid::Document

  field :c, as: :completed, type: Boolean, default: false
  embedded_in :sale

  validates :c, null: false
  validates :sale, null: false

  def complete_transaction
    self.update(completed: true)
  end
end
