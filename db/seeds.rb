# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = JSON.parse(File.read('app/assets/city.list.json'))

cities.each do |city|
  City.create!(
    name: city['name'],
    city_id: city['id'],
    lat: city['coord']['lat'],
    lon: city['coord']['lon'],
    country: city['country']
  )
end


City.limit(10).each do |city|
    city.attributes()
end

City.find(1).attributes.except('created_at', 'updated_at', 'id')