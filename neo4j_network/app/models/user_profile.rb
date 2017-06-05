class UserProfile 
  include Neo4j::ActiveNode

  property :name, type: String
  property :date_of_birth, type: DateTime
  has_one :out, :user, type: :user
  property :created_at
  property :updated_at

  validates :name, length: { minimum: 2, maximum: 20 }
  validates :date_of_birth, presence: true

end
