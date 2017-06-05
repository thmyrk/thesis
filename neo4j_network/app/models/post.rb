class Post 
  include Neo4j::ActiveNode

  property :message, type: String
  property :created_at
  property :updated_at
  has_one :in, :author, origin: :posts, model_class: :User
  has_one :out, :receiver, type: :written_to, model_class: :User

  validates :message, length: { minimum: 2, maximum: 500 }
  validates :author, presence: true
  validates :receiver, presence: true

end
