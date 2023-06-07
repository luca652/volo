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


user1 = User.create!( first_name: "Sara", last_name: "Carambola",
                     language: "Italian", number_of_children: 2, childrens_age: "primary",
                     location: "27, Plover Way, Canada Water, SE16 7TS", email: "sara@sara.com", password: "123456")


group1 = Group.create!(name: "Bambini di Peckham", location: "Peckham Rye", latitude: 51.46051, longitude:-0.06040, language: "Italian", user_id: user1.id)

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
