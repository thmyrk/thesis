class Post
  include Cequel::Record

  belongs_to :user
  key :id, :timeuuid, auto: true
  column :body, :text

  has_many :likes
  has_many :comments

  validates :body, presence: true
end
