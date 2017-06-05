class Comment
  include Cequel::Record

  belongs_to :post
  key :id, :timeuuid, auto: true
  column :body, :text
  column :user_name, :text, index: true

  validates :body, presence: true
  validates :user_name, presence: true
end
