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
  (1..3).each do |index|
    mayor = User.create(first_name: "mayor #{index}",
                last_name: Faker::Name.last_name,
                email: "mayor#{index}@example.com",
                password: '12345678')
    mayor.add_role :mayor
  end
  #---------------------------------
  regular = User.create(first_name: 'regular',
              last_name: 'user',
              email: 'regular@example.com',
              password: '12345678')
  regular.add_role :regular

  #----------------------
  (1..3).each do |index|
    place_owner = User.create(first_name: "placeowner #{index}",
                last_name: Faker::Name.last_name,
                email: "placeowner#{index}@example.com",
                password: '12345678'
              )
    place_owner.add_role :place_owner
  end

end


# # Cities
# #======================================================
# City.destroy_all

# ['Toronto', 'Jakarta', 'New York', 'Kualalumpur', 'Singapore'].each do |city_name|
#   user = User.with_role(:mayor).order("RANDOM()").first

#   if @city = City.create(name: city_name, user: user)
#     p "City #{@city.name} generated -------------"
#   else
#     p "#{@city.errors.full_messages} -------------"
#   end
# end


# Categories
#======================================================
['Food', 'Nightlife', 'Restaurants', 'Shopping', 'Active Life'].each do |category|
  if @category = Category.where(name: category).first_or_create
    p "Category #{@category.name} generated -------------"
  else
    p "#{@category.errors.full_messages} -------------"
  end
end


# City & Places
#======================================================
Country.destroy_all

50.times do
  company   = FFaker::Company.name
  addresses = JSON.parse(open("https://randomuser.me/api/").read)
  addr      = addresses['results'][0]['location']
  geocoded  = Geokit::Geocoders::GoogleGeocoder.geocode "#{addr['street']}, #{addr['city']}"

  if geocoded.success?
    country   = Country.where(name: geocoded.country).first_or_create
    city      = country.cities.where(name: addr['city'].titleize).first_or_create

    @place = city.places.new(
      name: company,
      about: FFaker::Lorem.paragraph,
      address: "#{addr['street']}, #{addr['postcode']}",
      phone: addresses['results'][0]['phone'],
      facebook: company.parameterize,
      twitter: "@#{company.parameterize}",
      instagram: "@#{company.parameterize}",
      web: "http://www.#{company.parameterize}.com",
      user: User.with_role(:place_owner).order("RANDOM()").first,
      tagline: FFaker::Lorem.paragraph
      )

    @place.categories << Category.order('RANDOM()').first(rand 1..3)

    if @place.save!
      p "Place #{@place.name} generated -------------"
    else
      p @place.errors
    end
  end
end


#=====================================================
if Blog.count == 0
  puts "Generate Blog -------------"
  (1..21).each do |index|
    user = User.with_role(:mayor).order("RANDOM()").first
    city = City.order("RANDOM()").first
    Blog.create(
              title: Faker::Hipster.sentence(7),
              description: Faker::Hipster.sentence(25),
              body: Faker::Hipster.paragraph(4),
              user_id: user.id,
              img: File.new("#{Rails.root}/app/assets/images/500-500.png"),
              city_id: city.id
            )
  end
end

puts "Generate data completed -------------"
