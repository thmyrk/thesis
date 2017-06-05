class Like
  include Cequel::Record

  belongs_to :post
  key :id, :timeuuid, auto: true
  column :user_name, :text, index: true

  validates :user_name, presence: true
end
