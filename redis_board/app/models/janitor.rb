class Janitor

  CATEGORY_COUNT = 50
  USER_COUNT = 30
  POST_COUNT = 2000
  TOPIC_COUNT = 400
  SUBSCRIPTION_COUNT = 300

  def self.delete_all_records
    puts "Deleting existing records"
    [Category, Post, User, Topic, Subscription].each(&:delete_all)
  end

  def self.generate_records
    puts "Generating records"

    categories = []
    CATEGORY_COUNT.times do
      categories << Category.new(name: Faker::App.name)
    end

    users = []
    USER_COUNT.times do
      users << User.new(name: Faker::Internet.user_name)
    end

    subscriptions = []
    SUBSCRIPTION_COUNT.times do
      subscriptions << Subscription.new(user: users.sample, category: categories.sample)
    end

    topics = []
    TOPIC_COUNT.times do
      topics << Topic.new(name: Faker::Book.title, user: users.sample, category: categories.sample)
    end

    posts = []
    POST_COUNT.times do
      posts << Post.new(title: Faker::Company.catch_phrase, body: Faker::Hacker.say_something_smart, user: users.sample, topic: topics.sample)
    end

    [categories, users, subscriptions, topics, posts]
  end

  def self.save_records(records)
    records.each do |arr|
      arr.each(&:save!)
    end
  end

end
