class Sale
  include Mongoid::Document

  field :p, as: :price, type: Integer
  belongs_to :staff
  embeds_one :transaction
  has_and_belongs_to_many :products

  validates :products, null: false
  validates :transaction, null: false
  validates :p, null: false

  def finish_sale
    self.transaction.complete_transaction
    self.products.each do |p|
      p.quantity -= 1
    end
  end
end
