class User 
  include Neo4j::ActiveNode

  property :created_at
  property :updated_at
  has_one :in, :user_profile, origin: :user, dependent: :delete_orphans
  has_many :out, :interests, rel_class: :InterestedIn
  has_many :out, :blocked, rel_class: :Blocked
  has_many :both, :friends, rel_class: :Friend
  has_many :both, :relatives, rel_class: :Relative
  has_many :both, :partners, rel_class: :Partner
  has_many :in, :posts, origin: :receiver
  has_many :out, :posts, type: :posted

  validates :user_profile, presence: true

  def distant_friends
    self.query_as(:user).match('user-[:knows*2]-(friend:User)').return('DISTINCT friend').to_a
  end

  def distant_friends2
    self.query_as(:user).match('user-[:knows*3]-(friend:User)').return('DISTINCT friend').to_a
  end

  def distant_friends3
    self.query_as(:user).match('user-[:knows*4]-(friend:User)').return('DISTINCT friend').to_a
  end

  # return friends whos at least one relative have interest given as a parameter
  def get_friends_with_interest(name)
    self.friends(:f).relatives.interests.where(name: name).pluck(:f)
  end

  # return an anniversary date of my friends relationship whos partner posted on my profile a post containing the word "of"
  def get_anniversary_date
    self.friends.partners(:p, :rel).posts(:post).where(receiver: self).where("post.message CONTAINS 'of'").pluck(:rel).map(&:anniversary_date)
  end

end
