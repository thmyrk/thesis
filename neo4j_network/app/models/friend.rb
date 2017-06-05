class Friend 
  include Neo4j::ActiveRel

  from_class :User
  to_class :User
  type :knows

  property :created_at
  property :updated_at

end
