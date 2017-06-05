# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ name: "John" }, { name: "Mike" }])
categories = Category.create([{ name: "Radiohead" }, { name: "Programming" }])
topics = Topic.create([{ name: "LP9", category: categories.first, user: users.first }, { name: "Ruby", category: categories.second, user: users.second }])
posts = Post.create([{ title: "What happens?", body: "Still no release", topic: topics.first, user: users.first }])
subscriptions = Subscription.create([{ user: users.first, category: categories.first }, { user: users.second, category: categories.second }])
