class Janitor
  USER_COUNT = 100
  INTEREST_COUNT = 100
  USER_INTEREST_COUNT = 200
  POST_COUNT = 1000
  FRIEND_COUNT = 1500
  BLOCKED_COUNT = 50
  PARTNER_COUNT = 100
  RELATIVE_COUNT = 100

  def self.delete_records
    puts "Deleting existing records"
    [User, Post, Interest].each(&:delete_all)
  end

  def self.generate_records
    puts "Generating records"
    relationships = %w(father mother son daughter cousin grandmother grandfather aunt uncle sibling)
    interests_list = %w(radiohead game\ of\ thrones guitar)

    users = []
    USER_COUNT.times do
      u = User.new
      u_p = UserProfile.new(name: Faker::Name.first_name, date_of_birth: Faker::Time.between(50.years.ago, 15.years.ago))
      u.user_profile = u_p
      users << u
    end

    interests = []
    INTEREST_COUNT.times do
      i = Interest.new(name: interests_list.sample, desc: Faker::Hacker.say_something_smart)
      interests << i
    end

    posts = []
    POST_COUNT.times do
      posts << Post.new(message: Faker::Hipster.sentence, author: users.sample, receiver: users.sample)
    end

    user_interests = []
    USER_INTEREST_COUNT.times do
      user_interests << UserInterest.new(user: users.sample, interest: interests.sample)
    end

    friends = []
    FRIEND_COUNT.times do
      friends << Friendship.new(person: users.sample, friend: users.sample)
    end

    blocked = []
    BLOCKED_COUNT.times do
      blocked << Block.new(blocker: users.sample, blocked_user: users.sample)
    end

    partners = []
    PARTNER_COUNT.times do
      partners << Partnership.new(person: users.sample, partner: users.sample, anniversary_date: Faker::Time.between(25.years.ago, Date.today))
    end

    relatives = []
    RELATIVE_COUNT.times do
      relatives << Kinship.new(person: users.sample, relative: users.sample, relationship_name: relationships.sample)
    end

    { objects: [users, interests, posts], relationships: [user_interests, blocked, friends, partners, relatives] }
  end

  def self.save_records(records)
    puts "Saving records"
    records.each do |arr|
      arr.each(&:save!)
    end
  end
end
