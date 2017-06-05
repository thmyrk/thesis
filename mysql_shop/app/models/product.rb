# == Schema Information
#
# Table name: products
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  quantity          :integer
#  price             :integer
#  product_info_id   :integer
#  product_info_type :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Product < ActiveRecord::Base
  has_many :products_sales
  has_many :sales, through: :products_sales

  belongs_to :product_info, polymorphic: true, dependent: :destroy

  validates :name, null: false
  validates :quantity, null: false
  validates :price, null: false
  validates :product_info, null: false

  def self.get_jazz_albums
    Product.joins("INNER JOIN music_cds ON (product_info_type = 'MusicCd' AND music_cds.id = product_info_id) AND music_cds.genre = 'Jazz'").order(quantity: "DESC")
  end

  def self.get_cheapest_game
    Product.where(product_info_type: "VideoGame").where('price >= 50').order(price: 'ASC').limit(1)
  end
end
