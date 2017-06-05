class Product
  include Mongoid::Document

  field :n, as: :name, type: String
  field :q, as: :quantity, type: Integer
  field :p, as: :price, type: Float
  has_and_belongs_to_many :sale

  validates :n, null: false
  validates :qu, null: false
  validates :p, null: false

  def self.get_jazz_albums
    Product.where(_type: "MusicCd", g: "Jazz").order_by(quantity: "desc")
  end

  def self.get_cheapest_game
    VideoGame.where(:price.lte => 50).order_by(price: "asc").limit(1)
  end

end
