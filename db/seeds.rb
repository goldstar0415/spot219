#==Seeds===============================
if(AdminUser.count == 0)
  puts "Generate AdminUser -------------"
  AdminUser.create!(email: 'admin@example.com',
                    password: 'password',
                    password_confirmation: 'password')
end

#----------------------------------------

if User.count == 0
  puts "Generate User -------------"
  admin = User.create(first_name: 'admin',
              last_name: 'user',
              email: 'admin_user@example.com',
              password: '12345678')
  admin.add_role :admin
  #---------------------------------------------
  mayor = User.create(first_name: 'mayor',
              last_name: 'user',
              email: 'mayor@example.com',
              password: '12345678')
  mayor.add_role :mayor
  #---------------------------------
  regular = User.create(first_name: 'regular',
              last_name: 'user',
              email: 'regular@example.com',
              password: '12345678')
  regular.add_role :regular

  #----------------------
  (1..5).each do |index|
    place_owner = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: '12345678'
              )
    place_owner.add_role :place_owner
  end

end

#======================================================
if City.count == 0
  puts "Generate City -------------"
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
end

#======================================================
if Place.count == 0
  puts "Generate Place -------------"
  (1..21).each do |index|
    user = User.with_role(:place_owner).order("RANDOM()").first
    city = City.order("RANDOM()").first
    Place.create(
              title: Faker::Hipster.sentence(7),
              description: Faker::Hipster.sentence(25),
              name: Faker::Address.street_name,
              about: city.about,
              country: Faker::Address.country,
              city_id: city.id,
              phone: Faker::PhoneNumber.phone_number,
              address: city.about,
              user_id: user.id,
              image: File.new("#{Rails.root}/app/assets/images/500-500.png"),
              fb: "", twit: "", insta: "", web: ""
            )
  end
end
#=====================================================
if Blog.count == 0
  puts "Generate Blog -------------"
  (1..21).each do |index|
    user = User.with_role(:place_owner).order("RANDOM()").first
    Blog.create(
              title: Faker::Hipster.sentence(7),
              description: Faker::Hipster.sentence(25),
              body: Faker::Hipster.paragraph(4),
              user_id: user.id,
              img: File.new("#{Rails.root}/app/assets/images/500-500.png")
            )
  end
end

puts "Generate data completed -------------"
