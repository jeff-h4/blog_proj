# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#NUM_ENTRIES = 100
#NUM_ENTRIES.times do
#  title = Faker::Hacker.say_something_smart
#  body = Faker::Lorem.paragraph
#  created_at = Time.now - (rand(30)).days
#  Post.create({title: title,
#               body: body,
#               created_at: created_at})
#  #body = Faker::Company.catch_phrase
#  #created_at = Time.now - (rand(30)).days
#  #Comment.create({body: body,
#  #             created_at: created_at})
#end
#
["Sports","Hacking","New Gadgets","Futurology","Old Problems",
 "Serious","Satire","Books","Inspirational","Rubbish","Men","Women","Politics","Cars","Misc"].each do |t|
  Tag.create(name: t);
end
