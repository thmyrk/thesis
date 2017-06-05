class Staff
  include Mongoid::Document
  include Mongoid::Timestamps

  field :p, as: :position
  field :n, as: :name
  has_many :sales

  validates :p, null: false
  validates :n, null: false
end
