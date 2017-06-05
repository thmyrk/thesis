class Janitor
  USER_COUNT = 500
  POST_COUNT = 10000
  SUB_COUNT = 3000
  LIKE_COUNT = 5000
  COMMENT_COUNT = 3000

  def self.delete_all_records
    puts "Emptying the database"
    [Post, User, Like, Comment, Subscription].each(&:delete_all)
  end

  def self.generate_records
    puts "Generating records"
    users = []
    USER_COUNT.times do |i|
      users << User.new(user_name: "user" + i.to_s)
    end

    posts = []
    POST_COUNT.times do
       posts << Post.new(user: users.sample, body: Faker::Hacker::say_something_smart)
    end

    subs = []
    SUB_COUNT.times do
      subs << Subscription.new(follower: users.sample, followed_name: users.sample.user_name)
    end

    likes = []
    LIKE_COUNT.times do
      likes << Like.new(post: posts.sample, user_name: users.sample.user_name)
    end

    comments = []
    COMMENT_COUNT.times do
      comments << Comment.new(post: posts.sample, user_name: users.sample, body: Faker::Hacker::say_something_smart)
    end

    [users, posts, subs, likes, comments]
  end

  def self.save_records(records)
    puts "Saving records"
    records.each do |arr|
      arr.each(&:save!)
    end
  end

end
