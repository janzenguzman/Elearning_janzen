# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: "Sample Admin",
  email: "sample@admin.com",
  password: "admin123",
  is_admin: true
)

20.times do |n|
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    is_admin: false
  )
end
