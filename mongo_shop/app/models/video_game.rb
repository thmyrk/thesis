class VideoGame < Product
  field :g, as: :genre, type: String
  field :a, as: :age_requirements, type: Integer

  validates :g, null: false
  validates :a, null: false
end
