# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Region.create(name: "Unknown")
Region.create(name: "Northeast")
Region.create(name: "Southeast")
Region.create(name: "Midwest")
Region.create(name: "Northwest")
Region.create(name: "West Coast")
Region.create(name: "Unamerican")

["Blonde", "Amber", "Lager", "Stout", "Wheat", "Oktoberfest", "Imperial", "IPA"].each do |t|
  BeerType.create(name: t )
end

(1990..2014).each do |year|
  url = URI.parse("http://api.brewerydb.com/v2/breweries?key=#{ENV['BREWERYDB_KEY']}&established=-#{year.to_s}")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
  results = JSON.parse(res.body)
  results["data"].each do |brewery|
    begin
      if brewery["name"]

        Brewery.create(name: brewery["name"], description: brewery["description"], url: brewery["website"], image: brewery["images"]["icon"], region_id: 1 )
      end
    rescue
      puts brewery
    end
  end
end

