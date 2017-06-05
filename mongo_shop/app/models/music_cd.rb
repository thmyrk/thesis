class MusicCd < Product
  field :a, as: :artist, type: String
  field :g, as: :genre, type: String

  validates :a, null: false
  validates :g, null: false
end
