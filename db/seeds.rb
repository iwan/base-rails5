# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {fn: "John", ln: "Bee", email: "a@b.com", pwd: "abC12345"}
]

users.each do |u|
  user = User.create(first_name: u[:fn], last_name: u[:ln], email: u[:email])
  Account.create(password: u[:pwd], user: user, email: u[:email])
end
