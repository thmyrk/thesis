class Interest 
  include Neo4j::ActiveNode

  has_many :in, :users, rel_class: :InterestedIn

  property :name, type: String
  property :desc, type: String
  property :created_at
  property :updated_at

end
