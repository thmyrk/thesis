class Movie < Product
  field :d, as: :director, type: String
  field :g, as: :genre, type: String
  field :a, as: :age_requirements, type: Integer

  validates :d, null: false
  validates :g, null: false
  validates :a, null: false
end
