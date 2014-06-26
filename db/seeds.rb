# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Region.create(name: "Northeast")
Region.create(name: "Southeast")
Region.create(name: "Midwest")
Region.create(name: "Northwest")
Region.create(name: "West Coast")
Region.create(name: "Unamerican")

["IPA", "Hefewizen", "Pale Ale", "Lager", "Stout", "Porter", "Cheap Beer", "Pilsner", "\"ICE\""].each do |t|
  BeerType.create(name: t )
end

Brewery.create(name: "Sam Adams", description: "Boston beer" ,city: "Boston", state: "MA", region_id: 1)
Brewery.create(name: "Abita", description: "Good beer" ,city: "New Orleans", state: "LA", region_id: 2)
Brewery.create(name: "Milwaukee's Best", description: "The Beast" ,city: "Milwaukee", state: "WI", region_id: 3)
Brewery.create(name: "Elisian", description: "Hipster beer" ,city: "Seattle", state: "WA", region_id: 4)
Brewery.create(name: "Stone Brewing", description: "Hoppy beer" ,city: "Escondito", state: "CA", region_id: 5)
Brewery.create(name: "Henekien", description: "German beer" ,city: "Germany", state: "Not America", region_id: 6)

(1..100).each do |t|
  FactoryGirl.create(:beer, name: "Beer" + t.to_s)
end
