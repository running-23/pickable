# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do |n|
  User.create!(
    name: "welcome#{n + 1}",
    email: "test#{n + 1}@test.com",
    password: "password#{n + 1}",
    password_confirmation: "password#{n + 1}",
    accept_random: 0,
    role: 0,
    github_name: "Git#{n + 1}",
    hiyoconne_url: "https://hiyoco-connect.herokuapp.com/profiles/2#{n + 1}"
  )
end

20.times do |n|
User.create!(
    name: "sleep#{n + 1}",
    email: "sleep#{n + 1}@test.com",
    password: "password#{n + 1}",
    password_confirmation: "password#{n + 1}",
    accept_random: 1,
    role: 0,
    github_name: "Hub#{n + 1}",
    hiyoconne_url: "https://hiyoco-connect.herokuapp.com/profiles/5#{n + 1}"
  )
end

Category.create(name: '勉強')
Category.create(name: '雑談')
Category.create(name: 'ゲーム')

User.all.ids.sort.each do |user_id|
  Category.all.ids.sort.each do |category_id|
    UserCategory.create(user_id: user_id, category_id: category_id)
  end
end
