# This file should contain all the record creation
# needed to seed the database with its default values.
#
# The data can then be loaded with the bin/rails db:seed
# command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 676.times do
#   Product.create(name:           Faker::Commerce.unique.product_name,
#                  price:          Faker::Commerce.price,
#                  stock_quantity: Faker::Number.number(digits: 2))
# end

# Use this Faker for generating categories
# Faker::Restaurant.type

require "csv"

Product.destroy_all
# Category.destroy.all

100.times do
  Product.create(name:        Faker::Food.dish,
                 description: Faker::Food.description,
                 price:       Faker::Number.decimal(l_digits: 2))
end
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
  password_confirmation: "password")
end
