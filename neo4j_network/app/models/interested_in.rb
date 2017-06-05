class InterestedIn 
  include Neo4j::ActiveRel

  from_class :User
  to_class :Interest

  property :created_at
  property :updated_at

end
