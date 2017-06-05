namespace :db do
  desc "Erase and fill database with random data"
  task :populate => :environment do
    require 'faker'

    puts "Deleting existing records"
    [Category, Post, User, Topic, Subscription].each(&:destroy_all)

    puts "Generating records"
    50.times do
      Category.create(name: Faker::App.name)
    end
    category_count = Category.count

    50.times do
      User.create(name: Faker::Internet.user_name)
    end
    user_count = User.count

    300.times do
      Subscription.create(user: get_rand_user, category: get_rand_category)
    end

    400.times do
      Topic.create(name: Faker::Book.title, user: get_rand_user, category: get_rand_category)
    end

    2000.times do
      Post.create(title: Faker::Company.catch_phrase, body: Faker::Hacker.say_something_smart, user: get_rand_user, topic: get_rand_topic)
    end

  end

  def get_rand_user
    User.offset(rand(User.count)).first
  end

  def get_rand_category
    Category.offset(rand(Category.count)).first
  end

  def get_rand_topic
    Topic.offset(rand(Topic.count)).first
  end

end
