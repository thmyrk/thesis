namespace :db do
  desc "Erase and fill database with random data"
  task :populate => :environment do
    require 'faker'

    puts "Deleting existing records"
    [Post, User, Subscription, Like, Comment].each(&:destroy_all)

    puts "Generating records"

    100.times do |i|
      User.create(user_name: "user" + i.to_s)
    end

    300.times do |i|
      Post.create(user: User["user" + (i*3%100).to_s], body: Faker::Hacker::say_something_smart)
    end

    150.times do |i|
      Subscription.create(follower: User["user" + (i*3%100).to_s], followed_name: "user" + (i*4%100).to_s)
    end

    400.times do |i|
      Like.create(post: Post["user" + (i*2%100).to_s].first, user_name: User["user" + (i*3%100).to_s].username)
    end

    400.times do |i|
      Comment.create(post: Post["user" + (i*3%100).to_s].first, user_name: User["user" + (i*3%100).to_s].username, body: Faker::Hacker::say_something_smart)
    end

  end

end
