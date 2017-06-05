class Relative 
  include Neo4j::ActiveRel

  from_class :User
  to_class :User
  type :is_related

  property :relationship_name, type: String
  property :created_at
  property :updated_at

  validates :relationship_name, inclusion: { in: %w(father mother son daughter cousin grandmother grandfather sibling uncle aunt) }

end
