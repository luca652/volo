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
                     location: "Canada Water", email: "sara@sara.com", password: "123456")


group1 = Group.create!(name: "Bambini di Peckham", location: "Peckham Rye", language: "Italian", user_id: user1.id)

event1 = Event.create!(name: "Crofton Park Story-Time in Italiano", location: "Crofton Park Library",
                       category: "Books", date: "", user_id: user1.id, group_id: group1.id)

resource1 = Resource.create!(title: "FABA - Music and stories in italian", category: "Stories", comment: "Changed my life!",
                             picture_url: "#", user_id: user1.id)
