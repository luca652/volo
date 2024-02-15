# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bingroup_images/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing database"
Booking.destroy_all
Event.destroy_all
Request.destroy_all
Message.destroy_all
Chatroom.destroy_all
Group.destroy_all
Story.destroy_all
Pin.destroy_all
Resource.destroy_all
User.destroy_all
puts "Database cleared"

# USERS

user1 = User.create!(first_name: "Vittoria", language: "Italian", number_of_children: 1, location: "27, Plover Way, Canada Water, SE16 7TS",
                     email: "vittoria@me.com", password: "123456", picture_url: "avatars/silvia.png")
user2 = User.create!(first_name: "Elisabetta", language: "Italian", number_of_children: 1, location: "5-6 Coulgate St, London SE4 2RW",
                     email: "elisabetta@me.com", password: "123456", picture_url: "avatars/elisabetta.png")
user3 = User.create!(first_name: "Jess", language: "Italian", number_of_children: 3, location: "21 Surrey Quays Rd, London SE16 7AR",
                     email: "jess@me.com", password: "123456", picture_url: "avatars/jess.png")
user4 = User.create!(first_name: "Luca", language: "Italian", number_of_children: 1, location: "10-14, Mercy Terrace, London SE13 7UX",
                     email: "mario@me.com", password: "123456", picture_url: "avatars/luca.png")
user5 = User.create!(first_name: "Laura", language: "English / Italian", number_of_children: 1,location: "10-14, Mercy Terrace, London SE13 7UX",
                     email: "laura@me.com", password: "123456", picture_url: "avatars/sara.png")
user6 = User.create!(first_name: "Mario", language: "English / Italian", number_of_children: 1, location: "10-14, Mercy Terrace, London SE13 7UX",
                     email: "luigi@me.com", password: "123456", picture_url: "avatars/luigi.png")

# the email variable is used to create unique email addresses dynamycally - the value is incremented each time it loops

# childrens_age = ["newborn", "pre-school", "primary"]
# email = 1
# 100.times do
#   User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, language: "English group_images/ Italian",
#                number_of_children: rand(1..6), childrens_age: childrens_age.sample, location: "10-14, Mercy Terrace, London SE13 7UX",
#                email: "#{email}@me.com", password: "123456")
#   email += 1
# end
puts "#{User.all.length} users created"

# group_images
group1 = Group.create!(name: "Bambini di Peckham", location: "95A Rye Ln, London SE15 4ST",
                       description: "We like to read stories and sing songs together. We also draw, paint and enjoy getting creative!",
                       picture_url: "group_images/bambini_peckam.png", language: "Italian", user_id: user1.id, children_age: "3-5")
group2 = Group.create!(name: "Brockley Playclub in Italiano", location: "1 Coulgate St, London SE4 2RW", description: "We like to play football in the park!",
                       picture_url: "group_images/brockley.png",language: "Italian", user_id: user2.id, children_age: "6-8")
group3 = Group.create!(name: "Quelli di Hilly Fields", location: "317 Brockley Rd, London SE4 2QZ",
                       picture_url: "group_images/hands.png", language: "Italian", user_id: user3.id, children_age: "3-5")
group4 = Group.create!(name: "Museo Horniman", location: "100 London Rd, London SE23 3PQ", description: "We love spending time at the
                       museum with the camel, the bees and il tricheco. We run treasure hunts in the park",
                       picture_url: "group_images/walrus.png", language: "Italian", user_id: user4.id, children_age: "3-5")
group5 = Group.create!(name: "Biblioteca di Canada Water", location: "21 Surrey Quays Rd, London SE16 7AR", description: "Join our story-telling group!",
                       picture_url: "group_images/canada.png", language: "Italian", user_id: user2.id, children_age: "3-5")

puts "#{Group.all.length} groups created"

#CHATROOM FOR GROUP
for group in Group.all do
  chat = Chatroom.create!(group_id: group.id)
end
puts "#{Chatroom.all.length} chatrooms created"

# REQUESTS
# request1 = Request.create!(user_id: user1.id, group_id: group1.id, accepted: true)
request2 = Request.create!(user_id: user2.id, group_id: group1.id, accepted: true)
request3 = Request.create!(user_id: user3.id, group_id: group1.id, accepted: true)
request4 = Request.create!(user_id: user4.id, group_id: group1.id, accepted: true)
request5 = Request.create!(user_id: user5.id, group_id: group1.id)
request11 = Request.create!(user_id: user6.id, group_id: group1.id)

request6 = Request.create!(user_id: user1.id, group_id: group3.id, accepted: true)

request7 = Request.create!(user_id: user2.id, group_id: group4.id, accepted: true)
request8 = Request.create!(user_id: user3.id, group_id: group3.id, accepted: true)
request9 = Request.create!(user_id: user4.id, group_id: group3.id, accepted: true)
request10 = Request.create!(user_id: user5.id, group_id: group3.id, accepted: true)
puts "#{Request.all.length} requests created"

# EVENTS
event1 = Event.create!(name: "Story-Time in Italiano", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                       date: Date.today + 4, user_id: user2.id, group_id: group1.id)
event2 = Event.create!(name: "Filastrocche nel parco", location: "Canada Water Library, 21 Surrey Quays Rd, London SE16 7AR",
                       date: Date.today, user_id: user3.id, group_id: group1.id)
event3 = Event.create!(name: "Puppet teather", location: "95A Rye Ln, London SE15 4ST",
                       date: Date.today + 1, user_id: user4.id, group_id: group1.id)
event4 = Event.create!(name: "Time to sing!", location: "1 Coulgate St, London SE4 2RW",
                       date: Date.today + 7, user_id: user4.id, group_id: group1.id)
event5 = Event.create!(name: "Sunday Morning Playclub", location: "317 Brockley Rd, London SE4 2QZG",
                       date: Date.today + 1, user_id: user3.id, group_id: group1.id)
event6 = Event.create!(name: "Picnic nel parco", location: "Hilly Fields, 375 Brockley Rd, London SE4 2AG",
                       date: Date.today, user_id: user2.id, group_id: group1.id)
event7 = Event.create!(name: "Festa di Andrea", location: "95 Church Rd, London SE19 2TA",
                       date: Date.today + 1, user_id: user4.id, group_id: group3.id)
event8 = Event.create!(name: "Cantiamo insieme!", location: "1 Coulgate St, London SE4 2RW",
                       date: Date.today + 7, user_id: user4.id, group_id: group3.id)
event9 = Event.create!(name: "Playclub della domenica", location: "317 Brockley Rd, London SE4 2QZG",
                       date: Date.today, user_id: user3.id, group_id: group3.id)
event10 = Event.create!(name: "Grigliata nel parco", location: "Hilly Fields, 375 Brockley Rd, London SE4 2AG",
                       date: Date.today + 4, user_id: user2.id, group_id: group3.id)
event11 = Event.create!(name: "Festa di Stefano", location: "95 Church Rd, London SE19 2TA",
                       date: Date.today + 1, user_id: user4.id, group_id: group3.id)
puts "#{Event.all.length} events created"

# BOOKINGS FOR EVENTS
booking1 = Booking.create!(event_id: event1.id, user_id: user1.id)
booking2 = Booking.create!(event_id: event7.id, user_id: user1.id)
booking3 = Booking.create!(event_id: event7.id, user_id: user2.id)
booking4 = Booking.create!(event_id: event7.id, user_id: user3.id)
booking5 = Booking.create!(event_id: event7.id, user_id: user4.id)
booking6 = Booking.create!(event_id: event7.id, user_id: user5.id)
booking7 = Booking.create!(event_id: event7.id, user_id: User.last.id)
puts "#{Booking.all.length} booking created"

#  RESOURCES
resource1 = Resource.create!(title: "FABA - Music and stories", category: "Stories",
                             comment: "Utilissimo! Each character sings songs or tells a story in Italian. My daughter loves it!",
                             picture_url: "resources/faba.png", user_id: user2.id)
resource2 = Resource.create!(title: "Favole al telefono", category: "Stories",
                             comment: "Un classico. L'ho letto quando andavo alle elementari! Ora lo sto leggendo a mia figlia!",
                             picture_url: "resources/rodari.png", user_id: user4.id)
resource3 = Resource.create!(title: "Talia e la valigia della idee", category: "Songs",
                             comment: "Weekly Italian playgroup in London. I bambini lo adorano e ci vogliono andare sempre.",
                             picture_url: "resources/talia.png", user_id: user2.id)
resource4 = Resource.create!(title: "Il libro degli errori", category: "Stories",
                             comment: "Ciao! Ho letto tutto Gianni Rodari quando ero piccola e adesso li sto leggo ai bambini.",
                             picture_url: "resources/rodari2.png", user_id: user3.id)
resource5 = Resource.create!(title: "Topolino", category: "Stories",
                             comment: "Ho regalato un abbonamento a mio figlio e gli piace un sacco. Utilissimo per parole nuove.",
                             picture_url: "resources/topolino.png", user_id: user3.id)
resource6 = Resource.create!(title: "Indagatore dell'incubo", category: "Stories",
                             comment: "Non per bambini ma per ragazzi/ragazze. Io ce li avevo tutti! È ambientato a Londra!",
                             picture_url: "resources/dylandog.png", user_id: user4.id)
resource7 = Resource.create!(title: "Mamma Dough Honor Oak", category: "Food",
                             comment: "Went here for a birthday party recently. They do a bunny rabbit pizza with ears.",
                             picture_url: "resources/pizza.png", user_id: user4.id)
resource8 = Resource.create!(title: "Passeggino definitivo", category: "General",
                             comment: "If you're planning to fly to Italy quite a bit, get this. It folds really really small!",
                             picture_url: "resources/pram.png", user_id: user3.id)
puts "#{Resource.all.length} resources created"

#PINS
# method below create pins for resources we have. Every time we do rails:db seed,the ids of all our instances increase.
# in order to keep file seed dynamic I stored our 5 main users into variables (user1, user2...). Here I am incrementing
# user5's id by n every time we loop.
Pin.create!(user_id: user1.id, resource_id: resource1.id)
Pin.create!(user_id: user1.id, resource_id: resource3.id)
Pin.create!(user_id: user1.id, resource_id: resource5.id)

# n = 1
# 99.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource1.id)
#   n += 1
# end

# n = 1
# 76.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource2.id)
#   n += 1
# end

# n = 1
# 55.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource3.id)
#   n += 1
# end

# n = 1
# 32.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource4.id)
#   n += 1
# end

# n = 1
# 24.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource6.id)
#   n += 1
# end

# n = 1
# 15.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource7.id)
#   n += 1
# end

# n = 1
# 8.times do
#   Pin.create!(user_id: "#{user5.id + n}", resource_id: resource8.id)
#   n += 1
# end
puts "#{Pin.all.length} pins created"
