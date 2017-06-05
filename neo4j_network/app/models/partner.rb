class Partner 
  include Neo4j::ActiveRel

  from_class :User
  to_class :User
  type :loves

  property :anniversary_date, type: DateTime
  property :created_at
  property :updated_at

end
