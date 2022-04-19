# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'


User.destroy_all
Group.destroy_all
Deal.destroy_all

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

User.create(name: 'tester', last_name: 'test', email: 'tester@gmail.com', password: '123456')

(1..5).each do
  user = User.new(
    name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save!
end

food = Group.create(name: 'Food', icon: 'https://www.svgrepo.com/show/366737/food.svg', user_id: 1)
clothes = Group.create(name: 'Clothes', icon: 'https://www.svgrepo.com/show/234568/clothes.svg', user_id: 1)
clothes = Group.create(name: 'Travel', icon: 'https://www.svgrepo.com/show/67444/travel.svg', user_id: 2)

food.deals.create(name: Faker::Food.dish, amount: 35.5, user_id: 1)
food.deals.create(name: Faker::Food.dish, amount: 50, user_id: 1)
food.deals.create(name: Faker::Food.dish, amount: 47, user_id: 1)
food.deals.create(name: Faker::Food.dish, amount: 22.5, user_id: 1)
food.deals.create(name: Faker::Food.dish, amount: 35.5, user_id: 1)