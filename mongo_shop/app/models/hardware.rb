class Hardware < Product
  field :w, as: :warranty, type: Integer # in months
  field :p, as: :purpose, type: String

  validates :w, null: false
  validates :p, null: false
end
