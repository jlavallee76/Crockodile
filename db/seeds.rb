require "csv"
require "open-uri"
require "json"

def fetch_data(url)
  JSON.parse(HTTP.get_response(url).read)
end

Product.destroy_all
Category.destroy_all
Province.destroy_all

Category.create!(heading: "Soup",
                 body:    Faker::Food.description,
                 display: true)

Category.create!(heading: "Dessert",
                 body:    Faker::Food.description,
                 display: true)

Category.create!(heading: "Apetizer",
                 body:    Faker::Food.description,
                 display: true)

Category.create!(heading: "Dinner",
                 body:    Faker::Food.description,
                 display: true)

Category.all.each do |category|
  25.times do
    product = Product.create(name:        Faker::Food.dish,
                             description: Faker::Food.description,
                             price:       Faker::Number.decimal(l_digits: 2),
                             category:    category)

    query = URI.encode_www_form_component([product.name, product.category.heading].join(","))
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    product.image.attach(io:       downloaded_image,
                         filename: "m-#{[product.name, product.category.heading].join('-')}.jpg")

    sleep(0.5)
  end
end

provinces = fetch_data("https://api.salestaxapi.ca/v2/province/all")
provinces.each do |province|
  gst = 0
  pst = 0
  province.each do |props|
    gst = props["gst"]
    pst = props["pst"]
  end
  Province.create(
    name:     province[0],
    gst_rate: gst,
    pst_rate: pst
  )
end

if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
  password_confirmation: "password")
end

# puts "Created #{Category.count} Categories"
# puts "Created #{Product.count} Products"
# puts "Created #{Province.count} Provinces"
