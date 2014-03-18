# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(first_name: "Matt", last_name: "Tucker", gender: "male", email: "mtuck06@gmail.com", password: "password")
User.create(first_name: "Luke", last_name: "Edwards", gender: "male", email: "luke.edwards05@gmail.com", password: "password")