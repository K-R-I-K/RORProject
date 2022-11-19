# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
session0 = WinterSession.create(
  year: 2022
)

10.times do |e|
  Student.create(
    lastname: "lastname" + e.to_s,
    group: "group" + (e / 5 + 1).to_s,
    geom: 1 + rand(4),
    alg: 1 + rand(4),
    inf: 1 + rand(4),
    winter_session: session0
  )
end