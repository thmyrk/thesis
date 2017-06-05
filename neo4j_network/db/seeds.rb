# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

i1 = Interest.new(name: "Radiohead", desc: "The best band in the world")
i1.save!
i2 = Interest.new(name: "Computers", desc: "I like trains")
i2.save!

u1 = User.new
u1_p = UserProfile.new(name: "John", date_of_birth: 20.years.ago)
u1.user_profile = u1_p
u1.save!

u2 = User.new
u2_p = UserProfile.new(name: "Mike", date_of_birth: 30.years.ago)
u2.user_profile = u2_p
u2.save!

u3 = User.new
u3_p = UserProfile.new(name: "Thom", date_of_birth: 45.years.ago)
u3.user_profile = u3_p
u3.save!

u4 = User.new
u4_p = UserProfile.new(name: "Ed", date_of_birth: 40.years.ago)
u4.user_profile = u4_p
u4.save!

InterestedIn.create(from_node: u1, to_node: i1)
InterestedIn.create(from_node: u2, to_node: i2)
