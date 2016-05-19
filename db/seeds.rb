
# User.create(first_name: 'Demo',
#             last_name: 'Demo',
#             email: 'demo@demo.com',
#             password: '12345678',
#             admin: true)
# AdminUser.create!(email: 'admin@example.com',
#                   password: 'password',
#                   password_confirmation: 'password')


#Create User ---------
(1..5).each do |index|
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: '12345678',
              admin: true
            )
end
(1..5).each do |index|
  City.create(
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              about: Faker::Address.street_address,
              city_name: Faker::Address.city,
              latitude: Faker::Address.latitude,
              longitude: Faker::Address.longitude,
              radius: index
            )
end
(1..10).each do |index|
  user = User.order("RANDOM()").first
  city = City.order("RANDOM()").first
  Place.create(
            name: Faker::Address.street_name,
            about: city.about,
            country: Faker::Address.country,
            city_id: city.id,
            phone: Faker::PhoneNumber.phone_number,
            address: city.about,
            user_id: user.id
          )
end
