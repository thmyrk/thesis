namespace :db do
  desc "Erase and fill database with random data"
  task :populate => :environment do
    require 'faker'

    puts "Deleting existing records"
    [User, Post, Interest].each(&:delete_all)

    puts "Generating records"
    relationships = %w(father mother son daugher cousin grandmother grandfather aunt uncle sibling)

    users = []
    100.times do
      u = User.new
      u_p = UserProfile.new(name: Faker::Name.first_name, date_of_birth: Faker::Time.between(50.years.ago, 15.years.ago))
      u.user_profile = u_p
      users << u
    end

    interests = []
    100.times do
      i = Interest.new(name: Faker::Book.genre, desc: Faker::Hacker.say_something_smart)
      interests << i
    end

    user_interests = []
    200.times do
      user_interests << InterestedIn.new(from_node: users.sample, to_node: interests.sample)
    end

    posts = []
    300.times do
      posts << Post.new(message: Faker::Hipster.sentence, author: users.sample, receiver: users.sample)
    end

    friends = []
    200.times do
      friends << Friend.new(from_node: users.sample, to_node: users.sample)
    end

    blocked = []
    30.times do
      friends << Friend.new(from_node: users.sample, to_node: users.sample)
    end

    partners = []
    30.times do
      partners << Partner.new(from_node: users.sample, to_node: users.sample, anniversary_date: Faker::Time.between(25.years.ago, Date.today))
    end

    relatives = []
    30.times do
      relatives << Relative.new(from_node: users.sample, to_node: users.sample, relationship_name: relationships.sample)
    end

    puts "Saving records"
    [users, interests, user_interests, posts, friends, blocked, partners, relatives].each do |arr|
      arr.each(&:save!)
    end

  end
end
