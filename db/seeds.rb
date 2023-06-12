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

# GROUPS
group1 = Group.create!(name: "Bambini di Peckham", location: "95A Rye Ln, London SE15 4ST",
          description: "Benvenuti nel gruppo! We meet regularly in the Peckham / Nunhead area.
                       Peckham Rye if the weather's good (is it ever?!) or Nunhead Library. Have a look at our
                       upcoming events and RSVP. Ciao!", picture_url: "/groups/peckham2.png", language: "Italian", user_id: user1.id,
                       childrens_age: ["3-5"])
group2 = Group.create!(name: "Brockley Playclub in Italiano", location: "1 Coulgate St, London SE4 2RW",
                       picture_url: "/groups/brockley.png",language: "French", user_id: user2.id, childrens_age: ["3-5", "6-8"])
group3 = Group.create!(name: "Quelli di Hilly Fields", location: "317 Brockley Rd, London SE4 2QZ",
                       picture_url: "/groups/brockley.png", language: "Italian", user_id: user3.id, childrens_age: ["new-born", "pre-school", "primary"])
group4 = Group.create!(name: "Horniman Museum - Gruppo italiano", location: "100 London Rd, London SE23 3PQ",
                       picture_url: "/groups/walrus.png", language: "German", user_id: user4.id, childrens_age: ["new-born", "pre-school", "primary"])
group5 = Group.create!(name: "Biblioteca di Canada Water", location: "21 Surrey Quays Rd, London SE16 7AR",
                       picture_url: "/groups/canada.png", language: "Italian", user_id: user2.id, childrens_age: ["pre-school"])
group6 = Group.create!(name: "Sydenham - Mayow Park", location: "313-315 Kirkdale, London SE26 4QB",
                       picture_url: "/groups/peckham.png", language: "Italian", user_id: user3.id, childrens_age: ["new-born", "pre-school", "primary"])
group7 = Group.create!(name: "I dinosauri di Crystal Palace", location: "95 Church Rd, London SE19 2TA",
                       picture_url: "/groups/crystalpalace.png", language: "Italian", user_id: user4.id, childrens_age: ["pre-school"])
group8 = Group.create!(name: "Dulwich Village - Mamme e bambini", location: "116a Lordship Ln, London SE22 8HD",
                       picture_url: "/groups/dulwich.png", language: "Italian", user_id: user2.id, childrens_age: ["new-born", "pre-school", "primary"])
group9 = Group.create!(name: "Brockwell Park - Estate Ragazzi", location: "10 Half Moon Ln, London SE24 9HU",
                       picture_url: "/groups/brockwell.png", language: "Italian", user_id: user3.id, childrens_age: ["primary"])
group10 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "The Hill Station, Kitto Rd, London SE14 5TW",
                        picture_url: "/groups/telegraph.png", language: "Italian", user_id: user4.id, childrens_age: ["primary"])

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
                             picture_url: "/assets/resources/faba.png", user_id: user2.id)
resource2 = Resource.create!(title: "Passeggino definitivo", category: "#",
                             comment: "If you're planning to fly to Italy quite a bit, get this. It folds really small
                             and you can take it on the plane",
                             picture_url: "/assets/resources/pram.png", user_id: user3.id)
resource3 = Resource.create!(title: "Le avventure di Cipollino", category: "reading",
                             comment: "Un classico. I loved it when I was a kid!",
                             picture_url: "/assets/resources/book.png", user_id: user4.id)
resource4 = Resource.create!(title: "Talia e la valigia della idee", category: "#",
                             comment: "Weekly Italian playgroups in London. Divertentissimo! Ve lo consiglio!",
                             picture_url: "/assets/resources/talia.png", user_id: user2.id)
resource5 = Resource.create!(title: "Mappa di Torino", category: "#",
                             comment: "Ciao! I bought this map for my daughter when we went to Torino for the weekend. She loved it!",
                             picture_url: "/assets/resources/mappa.png", user_id: user3.id)
resource6 = Resource.create!(title: "TOPOLINO", category: "reading",
                             comment: "Ho regalato un abbonamento a mio figlio e gli piace un sacco.
                             Utilissimo per imparare parole nuove.", picture_url: "/assets/resources/topolino.png", user_id: user3.id)
resource7 = Resource.create!(title: "Nascondini", category: "food",
                             comment: "Biscotti ecceziunali. The CostCutter near Brockley station stocks them.",
                             picture_url: "/assets/resources/biscotti.png", user_id: user4.id)
resource8 = Resource.create!(title: "Mamma Dough Honor Oak", category: "food",
                             comment: "Went here for a birthday party recently. Big place, very welcoming for children.
                             They do a bunny rabbit pizza with ears which kids love.",
                             picture_url: "/assets/resources/pizza.png", user_id: user4.id)
