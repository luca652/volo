# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Booking.destroy_all
Event.destroy_all
Request.destroy_all
Message.destroy_all
Chatroom.destroy_all
Group.destroy_all
Pin.destroy_all
Resource.destroy_all
User.destroy_all

# USERS

user1 = User.create!(first_name: "Sara", last_name: "Carambola", language: "Italian", number_of_children: 2,
                     childrens_age: "primary", location: "27, Plover Way, Canada Water, SE16 7TS",
                     email: "sara@me.com", password: "123456")
user2 = User.create!(first_name: "Elisabetta", last_name: "Bianchi", language: "Italian", number_of_children: 1,
                     childrens_age: "primary", location: "5-6 Coulgate St, London SE4 2RW",
                     email: "elisabetta@me.com", password: "123456")
user3 = User.create!(first_name: "Jess", last_name: "Ferretti", language: "Italian", number_of_children: 3,
                     childrens_age: "primary", location: "21 Surrey Quays Rd, London SE16 7AR",
                     email: "jess@me.com", password: "123456")
user4 = User.create!(first_name: "Mario", last_name: "Pastorelli", language: "Italian", number_of_children: 1,
                     childrens_age: "pre-school", location: "10-14, Mercy Terrace, London SE13 7UX",
                     email: "mario@me.com", password: "123456")
user5 = User.create!(first_name: "Laura", last_name: "Martin", language: "English / Italian", number_of_children: 1,
                      childrens_age: "pre-school", location: "10-14, Mercy Terrace, London SE13 7UX",
                      email: "laura@me.com", password: "123456")


# the email variable is used to create unique email addresses dynamycally - the value is incremented each time it loops
childrens_age = ["newborn", "pre-school", "primary"]
email = 1
100.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, language: "English / Italian",
               number_of_children: rand(1..6), childrens_age: childrens_age.sample, location: "10-14, Mercy Terrace, London SE13 7UX",
               email: "#{email}@me.com", password: "123456")
  email += 1
end



# GROUPS
group1 = Group.create!(name: "Bambini di Peckham", location: "95A Rye Ln, London SE15 4ST",
          description: "Our activities focus on readings, music and artcraft", picture_url: "group_images/BambiniPeckam.png", language: "Italian", user_id: user1.id,
                       children_age: "3-5")
group2 = Group.create!(name: "Brockley Playclub in Italiano", location: "1 Coulgate St, London SE4 2RW", description: "We like to play football in the park!",
                       picture_url: "group_images/brockley.png",language: "Italian", user_id: user2.id, children_age: "6-8")
group3 = Group.create!(name: "Quelli di Hilly Fields", location: "317 Brockley Rd, London SE4 2QZ",
                       picture_url: "group_images/brockley.png", language: "Italian", user_id: user3.id, children_age: "3-5")
group4 = Group.create!(name: "Horniman Museum - Gruppo italiano", location: "100 London Rd, London SE23 3PQ", description: "We organize treasure hunts based on the Horniman exhibitions",
                       picture_url: "group_images/walrus.png", language: "Italian", user_id: user4.id, children_age: "3-5")
group5 = Group.create!(name: "Biblioteca di Canada Water", location: "21 Surrey Quays Rd, London SE16 7AR", description: "Join our story-telling group!",
                       picture_url: "group_images/canada.png", language: "Italian", user_id: user2.id, children_age: "3-5")
group6 = Group.create!(name: "Sydenham - Mayow Park", location: "313-315 Kirkdale, London SE26 4QB", description: "Join our small tennis team!",
                       picture_url: "group_images/peckham.png", language: "Italian", user_id: user3.id, children_age: "5-8")
group7 = Group.create!(name: "I dinosauri di Crystal Palace", location: "95 Church Rd, London SE19 2TA", description: "We organise dino-themes activities!",
                       picture_url: "group_images/crystalpalace.png", language: "Italian", user_id: user4.id, children_age: "3-5")
group8 = Group.create!(name: "Dulwich Village - Mamme e bambini", location: "116a Lordship Ln, London SE22 8HD", description: "Join our baby-yoga sessions in the park!",
                       picture_url: "group_images/dulwich.png", language: "Italian", user_id: user2.id, children_age: "3-5")
group9 = Group.create!(name: "Brockwell Park - Estate Ragazzi", location: "10 Half Moon Ln, London SE24 9HU", description: "We organise a wide range of outdoor activities trought all the summer!",
                       picture_url: "group_images/brockwell.png", language: "Italian", user_id: user3.id, children_age: "7-13")
group10 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "The Hill Station, Kitto Rd, London SE14 5TW", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")

group11 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "The Old Sessions House, 22 Clerkenwell Grn, London EC1R 0NA", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group12 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "First Floor, 2 Percy St, London W1T 1DD", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group13 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "18 Soho Square, London W1D 3QL", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group14 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "70-71 Shelton St, London WC2H 9JQ", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group15 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "88 Masbro Rd, Brook Grn, London W14 0LR", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group16 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "22-28 Broadway, London SW1H 0BH", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group17 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "101 Wood Ln, London W12 7FR", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group18 = Group.create!(name: "Telegraph Hill - Doposcuola", location: " 94 Waterford Rd, London SW6 2HA", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group19 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "13-15 West St, London WC2H 9NE", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")
group20 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "104 Chepstow Rd, London W2 5QS", description: "We organise sessions to help children with thier homework",
                        picture_url: "group_images/telegraph.png", language: "Italian", user_id: user4.id, children_age: "5-13")


#CHATROOM FOR GROUP
Chatroom.create!(group_id: group1.id)
puts "chatroom created"

# REQUESTS
request1 = Request.create!(user_id: user1.id, group_id: group2.id, accepted: true)
request2 = Request.create!(user_id: user2.id, group_id: group1.id, accepted: true)
request3 = Request.create!(user_id: user3.id, group_id: group1.id, accepted: true)
request4 = Request.create!(user_id: user4.id, group_id: group1.id, accepted: true)
request5 = Request.create!(user_id: user5.id, group_id: group1.id)
puts "resquest created"

# EVENTS
event1 = Event.create!(name: "Story-Time in Italiano", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                       category: "Reading", date: "2023-7-2, 10:00AM", user_id: user2.id, group_id: group1.id)
event2 = Event.create!(name: "Filastrocche nel parco", location: "Canada Water Library, 21 Surrey Quays Rd, London SE16 7AR",
                       category: "Activity", date: "2023-7-9, 4:00PM", user_id: user3.id, group_id: group1.id)
event3 = Event.create!(name: "Puppet teather", location: "95A Rye Ln, London SE15 4ST",
                       category: "Activity", date: "2023-7-12, 12:00PM", user_id: user4.id, group_id: group1.id)
event4 = Event.create!(name: "Time to sing!", location: "1 Coulgate St, London SE4 2RW",
                       category: "Music", date: "2023-8-15, 2:00PM", user_id: user4.id, group_id: group1.id)
event5 = Event.create!(name: "Sunday Morning Playclub", location: "317 Brockley Rd, London SE4 2QZG",
                       category: "", date: "2023-7-20, 9:00AM", user_id: user3.id, group_id: group1.id)
event6 = Event.create!(name: "Picnic nel parco", location: "Hilly Fields, 375 Brockley Rd, London SE4 2AG",
                       category: "Activity", date: "2023-8-12, 4:30PM", user_id: user2.id, group_id: group1.id)
event7 = Event.create!(name: "Festa di compleanno di Andrea", location: "95 Church Rd, London SE19 2TA",
                       category: "Activity", date: "2023-7-30, 10:00AM", user_id: user4.id, group_id: group1.id)

# BOOKINGS FOR EVENTS
booking1 = Booking.create!(event_id: event1.id, user_id: user1.id)
# booking2 = Booking.create!(event_id: event5.id, user_id: user1.id)
# booking3 = Booking.create!(event_id: event6.id, user_id: user1.id)
# booking4 = Booking.create!(event_id: event7.id, user_id: user1.id)

#  RESOURCES
resource1 = Resource.create!(title: "FABA - Music and stories in italian", category: "Stories",
                             comment: "Utilissimo! Each character sings songs or tells a story in Italian. My daughter loves it!",
                             picture_url: "resources/pizza.png", user_id: user2.id)
resource2 = Resource.create!(title: "Passeggino definitivo", category: "#",
                             comment: "If you're planning to fly to Italy quite a bit, get this. It folds really small
                             and you can take it on the plane",
                             picture_url: "resources/pram.png", user_id: user3.id)
resource3 = Resource.create!(title: "Le avventure di Cipollino", category: "reading",
                             comment: "Un classico. I loved it when I was a kid!",
                             picture_url: "resources/book.png", user_id: user4.id)
resource4 = Resource.create!(title: "Talia e la valigia della idee", category: "#",
                             comment: "Weekly Italian playgroups in London. Divertentissimo! Ve lo consiglio!",
                             picture_url: "resources/talia.png", user_id: user2.id)
# resource5 = Resource.create!(title: "Mappa di Torino", category: "#",
#                              comment: "Ciao! I bought this map for my daughter when we went to Torino for the weekend. She loved it!",
#                              picture_url: "resources/mappa.png", user_id: user3.id)
resource6 = Resource.create!(title: "TOPOLINO", category: "reading",
                             comment: "Ho regalato un abbonamento a mio figlio e gli piace un sacco.
                             Utilissimo per imparare parole nuove.", picture_url: "/assets/resources/topolino.png", user_id: user3.id)
resource7 = Resource.create!(title: "Nascondini", category: "food",
                             comment: "Biscotti ecceziunali. The CostCutter near Brockley station stocks them.",
                             picture_url: "resources/biscotti.png", user_id: user4.id)
resource8 = Resource.create!(title: "Mamma Dough Honor Oak", category: "food",
                             comment: "Went here for a birthday party recently. Big place, very welcoming for children.
                             They do a bunny rabbit pizza with ears which kids love.",
                             picture_url: "resources/pizza.png", user_id: user4.id)


#PINS
# method below create pins for resources we have. Every time we do rails:db seed,the ids of all our instances increase.
# in order to keep file seed dynamic I stored our 5 main users into variables (user1, user2...). Here I am incrementing
# user5's id by n every time we loop.
n = 1
99.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource1.id)
  n += 1
end

n = 1
76.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource2.id)
  n += 1
end

n = 1
55.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource3.id)
  n += 1
end

n = 1
32.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource4.id)
  n += 1
end

n = 1
24.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource6.id)
  n += 1
end

n = 1
15.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource7.id)
  n += 1
end

n = 1
8.times do
  Pin.create!(user_id: "#{user5.id + n}", resource_id: resource8.id)
  n += 1
end
