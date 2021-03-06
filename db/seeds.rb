# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
  [
    { username: 'admin', email: 'admin@mail.com', password: 'password', admin: 1},
    { username: 'Mason', email: 'mason@mail.com', password: 'password'},
    { username: 'Chloe', email: 'chloe@mail.com', password: 'password'},
    { username: 'Seb', email: 'seb@mail.com', password: 'password'},
    { username: 'Michael', email: 'michael@mail.com', password: 'password'},
    { username: 'Gus', email: 'gus@mail.com', password: 'password'},
    { username: 'Theo', email: 'theo@mail.com', password: 'password'},
  ]
  )

projects = Project.create(
  [
    {name: 'Unsorted', deadline: Date.new(9999, 1, 1)},
    {name: 'Build-a-Bear', deadline: Date.new(2020, 12, 4)},
    {name: 'Treehouse', deadline: Date.new(2019, 2, 4)},
    {name: 'Fly-A-Kite', deadline: Date.new(2019, 3, 4)},
    {name: 'Theo Birthday', deadline: Date.new(2019, 5, 4)}
  ]
)

# users.each do |user|
#   user.projects << Project.find_by(name: "Unsorted")
# end