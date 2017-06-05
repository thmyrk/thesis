class Blocked
  include Neo4j::ActiveRel

  from_class :User
  to_class :User
  type :blocked

  property :created_at
  property :updated_at

end
