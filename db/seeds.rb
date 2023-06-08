# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Event.destroy_all
Group.destroy_all
User.destroy_all
Resource.destroy_all


user1 = User.create!(first_name: "Sara", last_name: "Carambola", language: "Italian", number_of_children: 2,
                     childrens_age: "primary", location: "27, Plover Way, Canada Water, SE16 7TS",
                     email: "sara@me.com", password: "123456")
user2 = User.create!(first_name: "Elisabetta", last_name: "Bianchi", language: "Italian", number_of_children: 1,
                     childrens_age: "primary", location: "5-6 Coulgate St, London SE4 2RW",
                     email: "elisabetta@me.com", password: "123456")
user3 = User.create!(first_name: "Jess", last_name: "Ferretti", language: "Italian", number_of_children: 3,
                     childrens_age: "primary", location: "21 Surrey Quays Rd, London SE16 7AR",
                     email: "elisabetta@me.com", password: "123456")
user4 = User.create!(first_name: "Mario", last_name: "Pastorelli", language: "Italian", number_of_children: 1,
                     childrens_age: "pre-school", location: "10-14, Mercy Terrace, London SE13 7UX",
                     email: "elisabetta@me.com", password: "123456")


group1 = Group.create!(name: "Bambini di Peckham", location: "Peckham Rye", latitude: 51.46051,
                       longitude: -0.06040, language: "Italian", user_id: user1.id)
group2 = Group.create!(name: "Brockley Playclub in Italiano", location: "Brockley", latitude: 51.463009,
                       longitude: -0.04091, language: "Italian", user_id: user2.id)
group3 = Group.create!(name: "Quelli di Hilly Fields", location: "Brockley", latitude: 51.45977,
                       longitude: -0.02391, language: "Italian", user_id: user3.id)
group4 = Group.create!(name: "Horniman Museum - Gruppo italiano", location: "Forest Hill", latitude: 51.441047,
                       longitude: -0.061680, language: "Italian", user_id: user4.id)
group5 = Group.create!(name: "Biblioteca di Canada Water", location: "Forest Hill", latitude: 51.497684,
                       longitude: -0.049308, language: "Italian", user_id: user2.id)
group6 = Group.create!(name: "Sydenham - Mayow Park", location: "Sydenham", latitude: 51.430003,
                       longitude: -0.049165, language: "Italian", user_id: user3.id)
group7 = Group.create!(name: "I dinosauri di Crystal Palace", location: "Crystal Palace", latitude: 51.418972,
                       longitude: -0.065530, language: "Italian", user_id: user4.id)
group8 = Group.create!(name: "Dulwich Village - Mamme e bambini", location: "Dulwich Village", latitude: 51.450792,
                       longitude: -0.085519, language: "Italian", user_id: user2.id)
group9 = Group.create!(name: "Brockwell Park - Estate Ragazzi", location: "Herne Hill", latitude: 51.4510004,
                       longitude: -0.1075706, language: "Italian", user_id: user3.id)
group10 = Group.create!(name: "Telegraph Hill - Doposcuola", location: "New Cross Gate", latitude: 51.468959,
                       longitude: -0.044985, language: "Italian", user_id: user4.id)


event1 = Event.create!(name: "Story-Time in Italiano", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                       category: "Reading", date: "", user_id: user1.id, group_id: group1.id)

event2 = Event.create!(name: "Christmans song!", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                      category: "Activity", date: "", user_id: user1.id, group_id: group1.id)

event3 = Event.create!(name: "Puppet teather", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                      category: "Activity", date: "", user_id: user1.id, group_id: group1.id)

event4 = Event.create!(name: "Story-Time in Italiano", location: "Crofton Park Library, 375 Brockley Rd, London SE4 2AG",
                        category: "Reading", date: "", user_id: user1.id, group_id: group1.id)

resource1 = Resource.create!(title: "FABA - Music and stories in italian", category: "Stories", comment: "Changed my life!",
                             picture_url: "#", user_id: user1.id)
resource2 = Resource.create!(title: "Italian cookbooks", category: "Cook book", comment: "Delicious!",
                             picture_url: "#", user_id: user1.id)
