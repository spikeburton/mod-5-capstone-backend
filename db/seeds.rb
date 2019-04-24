# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
API = "https://raw.githubusercontent.com/spikeburton/scenic-byway-api/master/db.json"

User.create(username: "darryl", password: "p@ssw0rd", email: "darryl.figtree@gmail.com", first_name: "Darryl", last_name: "Fiddle-Leaf")

data = JSON.parse(RestClient.get(API))
drives = data["byways"]["GA"]
